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
    let icerik : Content?
    let name : String?
    let turu : String?
}

struct Content: Codable {
    let resim : String?
    let seoAdi: String?
    let id: String
    let username: String?

    enum CodingKeys: String, CodingKey {
        case resim = "resim"
        case seoAdi = "seoadi"
        case id = "id"
        case username = "kadi"
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if let identifier = try? container.decode(String.self, forKey: .id) {
                self.id = identifier
            } else if let identifier = try? container.decode(Int.self, forKey: .id) {
                self.id = "(identifier)"
            } else {
                self.id = ""
            }
            self.resim = try container.decodeIfPresent(String.self, forKey: .resim)
            self.seoAdi = try container.decodeIfPresent(String.self, forKey: .seoAdi)
            self.username = try container.decodeIfPresent(String.self, forKey: .username)
        }
}
