//
//  ViewControllerService.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import Foundation
import UIKit
protocol ViewControllerProtocol {
    func getimageLinks(id: Int, completionHandler: @escaping (ViewControllerResponse) -> Void)
    func getImages(imageUrls: [String?], completion: @escaping (_ images: [UIImage?]) -> Void)
}

final class MainService: ViewControllerProtocol {
    
    func getimageLinks(id: Int, completionHandler: @escaping (ViewControllerResponse) -> Void) {
        ServiceLayer().fetchImagesLink(id: id, completionHandler: completionHandler)
    }
    
    func getImages(imageUrls: [String?], completion: @escaping ([UIImage?]) -> Void) {
        ServiceLayer().downloadImages(imageUrls: imageUrls, completion: completion)
    }
    
}
