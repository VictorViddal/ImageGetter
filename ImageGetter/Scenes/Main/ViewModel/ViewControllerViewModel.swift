//
//  ViewControllerViewModel.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import Foundation
import UIKit
class ViewControllerViewModel {
    private var service: ViewControllerProtocol?
    private var images: [UIImage?] = []
    private var count: Int? = 0
    
    init(service: ViewControllerProtocol = MainService()) {
        self.service = service
    }
    
    func fetchImages(id: Int, completionHandler:  @escaping () -> Void) {
        service?.getimageLinks(id: id, completionHandler: { response in
            let images = response.data.compactMap({$0.images?.first})
            let links = images.map({$0?.link})
            self.service?.getImages(imageUrls: links, completion: { images in
                print(images)
                self.images = images.filter({$0 != UIImage()})
                completionHandler()
            })
        })
    }
    
    func newPagesForImages() -> Int {
        guard let page = count else {return 0}
        return page + 1
    }
}

extension ViewControllerViewModel {
    
    func numberOfRows() -> Int {
        let rows = CGFloat(images.count/4).rounded(.down)
        return Int(rows)
    }
    
    func generateCell(for tableView: UITableView,
                      indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell",
                                                       for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
        
        let imageModel = ImageCellModel(Image1: images[0 + (indexPath.row * 4)],
                                        Image2: images[1 + (indexPath.row * 4)],
                                        Image3: images[2 + (indexPath.row * 4)],
                                        Image4: images[3 + (indexPath.row * 4)])
        let imageCellViewModel = ImageCellViewModel()
        imageCellViewModel.create(model: imageModel)
        cell.setupValues(viewModel: imageCellViewModel)
        return cell
    }
}
