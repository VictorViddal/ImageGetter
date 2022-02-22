//
//  ViewControllerResponse.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import Foundation

struct ViewControllerResponse: Codable {
    
    var data: [Images]
    
    struct Images: Codable {
        var id: String?
        var link: String?
    }
    
}
