//
//  AuthorEntity.swift
//  PagePal
//
//  Created by Irem Subası on 18.06.2023.
//

import Foundation
struct AuthorResponse: Codable {
    let yazar : AboutAuthor?
}
struct AboutAuthor:Codable{
    let ozellik : [Skills]
    let authorName: String?
    let resim: URL?
    let puan: String?
    let puanVerenKisi: String?
    let okuyanKisiSayisi: String?
    let begeniDuz: Int?
    let gosterimDuz: Int?
    
    enum CodingKeys: String, CodingKey{
        case resim,puan, begeniDuz,gosterimDuz
        case ozellik = "turler"
        case authorName = "adi"
        case okuyanKisiSayisi = "okudu"
        case puanVerenKisi = "puan_kisiDuz"
    }
}

struct Skills: Codable{
    let isi: String?
    
    enum CodingKeys: String, CodingKey{
        case isi = "baslik"
    }
}
