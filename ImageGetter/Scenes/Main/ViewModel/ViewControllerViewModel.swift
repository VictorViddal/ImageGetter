//
//  ViewControllerViewModel.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import Foundation
import UIKit
class ViewControllerViewModel {
    private var model: ViewControllerModel?
    
    init(model: ViewControllerModel = ViewControllerModel(images: [])) {
        self.model = model
    }
    
}

extension ViewControllerViewModel {
    
    func numberOfRows() -> Int {
        return model?.images.count ?? 0
    }
    
    func generateCell(for tableView: UITableView,
                      indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImagetableViewCell",
                                                       for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
        let imageModel = ImageCellModel(Image1: UIImage(), Image2: UIImage(), Image3: UIImage(), Image4: UIImage())
        let imageCellViewModel = ImageCellViewModel ()
        imageCellViewModel.create(model: imageModel)
        return cell
    }
}
