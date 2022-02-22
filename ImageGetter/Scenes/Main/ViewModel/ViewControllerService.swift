//
//  ViewControllerService.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import Foundation

protocol ViewControllerProtocol {
    func getimageLinks(id: Int, completionHandler: @escaping (ViewControllerResponse) -> Void)
}

final class MainService: ViewControllerProtocol {
    
    func getimageLinks(id: Int, completionHandler: @escaping (ViewControllerResponse) -> Void) {
        ServiceLayer().fetchImagesLink(id: id, completionHandler: completionHandler)
    }
    
}
