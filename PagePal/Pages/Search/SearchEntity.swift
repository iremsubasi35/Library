//
//  SearchEntity.swift
//  PagePal
//
//  Created by Irem Subası on 19.06.2023.
//

import Foundation

struct SearchResponse: Codable {
    let sonuclar : [Results]
}

struct Results: Codable{
    let icerik : [Content]
    let name : String?
    let turu : String?
}

struct Content: Codable {
    let resim : String?
}
