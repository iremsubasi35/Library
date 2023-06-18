//
//  BookEntity.swift
//  PagePal
//
//  Created by Irem Subası on 18.06.2023.
//

import Foundation

struct BookResponse: Codable {
    let kitap : AboutBook?
}

struct AboutBook: Codable {
    let katkisiOlanlar:[Authors]
    let adi: String?
    let kitapResim: String?
    let puan: String?
    let okuyanKisiSayisi: String?
    let begeniDuz: Int?
    let gosterimDuz: Int?
    let puanVerenKisi: String?
    let yazar: String
    
    enum CodingKeys: String, CodingKey {
            case adi, puan, begeniDuz, gosterimDuz
           case katkisiOlanlar = "yazarlar"
            case kitapResim = "resim"
            case okuyanKisiSayisi = "okudu"
            case puanVerenKisi = "puan_kisiDuz"
            case yazar = "ilkYazar"
        }
}

struct Authors: Codable{
    let adi: String?
    let gorevi: String?
    enum CodingKeys: String, CodingKey{
        case adi
        case gorevi = "kitapYazarTurBaslik"
    }
}
// gonderileri index 1 

