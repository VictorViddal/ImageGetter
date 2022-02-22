//
//  ServiceLayer.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import Foundation
import UIKit
class ServiceLayer {

    func fetchImagesLink(id: Int, completionHandler: @escaping (ViewControllerResponse) -> Void) {
        //tSOyhv
        let imageUrl = "https://api.imgur.com/3/gallery/hot/viral/\(id).json"
        guard let url = URL(string: imageUrl) else {return}

        let request = NSMutableURLRequest(url: url)
            request.setValue("Client-ID e8c1dfb4717a389", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching image links: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
            return
          }

          if let data = data,
            let imagesLink = try? JSONDecoder().decode(ViewControllerResponse.self, from: data) {
            completionHandler(imagesLink)
          }
        })
        task.resume()
      }
    
    func downloadImages(imageUrls: [String?], completion: @escaping (_ images: [UIImage?]) -> Void) {
        // Create URL
        var imageArray: [UIImage] = []
        var downloadCounter = 0
            
            for link in imageUrls {
                guard let url = URL(string: link ?? "") else {return}
                let  downloadQueue = DispatchQueue(label: "imageDowmloadQueue")
                
                downloadQueue.sync {
                    downloadCounter += 1
                    if let data = try? Data(contentsOf: url) {
                        //image data ready and need to be converted to UIImage
                        let image = UIImage(data: data) ?? UIImage()
                        imageArray.append(image)
                        
                        if downloadCounter == imageArray.count {
                            DispatchQueue.main.async {
                                completion(imageArray)
                                
                            }
                        }
                    }else {
                        print("couldnt download image")
                        completion(imageArray)
                    }
                }
            }
    }
    
}

