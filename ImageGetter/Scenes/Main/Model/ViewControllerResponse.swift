//
//  ViewControllerResponse.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import Foundation

struct ViewControllerResponse: Codable {
    
    var data: [DataAlbum]
    
    struct DataAlbum: Codable {
        var id: String?
        var link: String?
        var title: String?
        var images: [Images?]?
    }
    
    struct Images: Codable {
        var id: String?
        var link: String?
        var title: String?
    }
    
}
