//
//  AuthorEntity.swift
//  PagePal
//
//  Created by Irem Subası on 18.06.2023.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authorEmpty = try? JSONDecoder().decode(AuthorEmpty.self, from: jsonData)

import Foundation

// MARK: - AuthorEmpty
struct AuthorResponse: Codable {
    let yazar: AuthorYazar
    let toplamSayfa, kume, toplamIcerik, sayfa: Int
    let z, b, sayfaBasi: Int
    let gonderiler: [AuthorGonderiler]
    let bilgi: Int
    let bilgiMesaji, apiSurum: String
    let apiB: Bool
    let apiT: String

    enum CodingKeys: String, CodingKey {
        case yazar, toplamSayfa, kume, toplamIcerik, sayfa, z, b, sayfaBasi, gonderiler, bilgi, bilgiMesaji
        case apiSurum = "_api_surum"
        case apiB = "_api_b"
        case apiT = "_api_t"
    }
}

// MARK: - AuthorGonderiler
struct AuthorGonderiler: Codable {
    let renderTuru: String?
    let adsense: Int?
    let clientID, birimKodu, width, height: String?
    let esnek: Bool?
    let veri: AuthorVeri?
    let bolum, baslik: String?
    let id, turu, icerikid, turualt: String?
    let silinme, islem, tarihsaat, uyeid: String?
    let icerikidalt: String?
    let begeniSayisi: AuthorBegeniSayisi?
    let yorumSayisi, paylasimSayisi, konuID, yer: String?
    let ustID: String?
    let ustIDFarkliMi: Int?
    let menu, paylasMenu: String?
    let alintiSayisi: Int?
    let uye: AuthorUye?
    let buton: AuthorButon?
    let sayfa: AuthorSayfa?
    let konu: AuthorKonu?
    let govde: [AuthorGovde]?
    let govdeSayfa: [AuthorGovdeSayfa]?

    enum CodingKeys: String, CodingKey {
        case renderTuru, adsense
        case clientID = "clientId"
        case birimKodu, width, height, esnek, veri, bolum, baslik, id, turu, icerikid, turualt, silinme, islem, tarihsaat, uyeid, icerikidalt, begeniSayisi, yorumSayisi, paylasimSayisi
        case konuID = "konuId"
        case yer
        case ustID = "ustId"
        case ustIDFarkliMi = "ustIdFarkliMi"
        case menu
        case paylasMenu = "paylas_menu"
        case alintiSayisi, uye, buton, sayfa, konu, govde, govdeSayfa
    }
}


// MARK: - AuthorOkumaDurumuButon
struct AuthorOkumaDurumuButon: Codable {
    let yazi: AuthorYazi
    let durum: String
}

enum AuthorYazi: String, Codable {
    case okuyacaklarımaEkle = "Okuyacaklarıma Ekle"
}

enum AuthorRenderTuru: String, Codable {
    case kitap = "kitap"
}

// MARK: - AuthorYazarlar
struct AuthorYazarlar: Codable {
    let id, adi: String
    let resim, resimB: String
    let seoAdi, silinme, puanKisi, puan: String
    let okudu, kitapSayisi: String
    let turlerAdi: AuthorTurlerAdi
    let kitapYazarTurBaslik: AuthorKitapYazarTurBaslik

    enum CodingKeys: String, CodingKey {
        case id, adi, resim, resimB
        case seoAdi = "seo_adi"
        case silinme
        case puanKisi = "puan_kisi"
        case puan, okudu, kitapSayisi, turlerAdi, kitapYazarTurBaslik
    }
}

enum AuthorKitapYazarTurBaslik: String, Codable {
    case derleyen = "Derleyen"
    case yazar = "Yazar"
    case çevirmen = "Çevirmen"
}

enum AuthorTurlerAdi: String, Codable {
    case derleyenEditör = "Derleyen, Editör"
    case yazar = "Yazar"
    case yazarDerleyenÇevirmen = "Yazar, Derleyen, Çevirmen"
    case yazarÇevirmen = "Yazar, Çevirmen"
    case yazarÇevirmenEditör = "Yazar, Çevirmen, Editör"
    case çevirmen = "Çevirmen"
}

// MARK: - AuthorYorumlar
struct AuthorYorumlar: Codable {
    let id, etiketID, islemid, tarihsaat: String
    let yorumParse: AuthorParse

    enum CodingKeys: String, CodingKey {
        case id
        case etiketID = "etiketId"
        case islemid, tarihsaat, yorumParse
    }
}

// MARK: - AuthorParse
struct AuthorParse: Codable {
    let key: String
    let dolu, isUzunKisaltma, isKisaKisaltma: Bool
    let parseKisa: [String]
    let orjParse: [String]?
}

enum AuthorBegeniSayisi: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(AuthorBegeniSayisi.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AuthorBegeniSayisi"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - AuthorButon
struct AuthorButon: Codable {
    let begeni, paylas, alintilayarakPaylas: Int
    let kaydetDurum: String
}

// MARK: - AuthorGovde
struct AuthorGovde: Codable {
    let baslik, islemid: String
}

// MARK: - AuthorGovdeSayfa
struct AuthorGovdeSayfa: Codable {
    let baslik: String
    let puan: String?
    let max: Int?
    let title: String?
}

// MARK: - AuthorKonu
struct AuthorKonu: Codable {
    let id, seoAdi, adi, baslik: String
    let ikon, gundemSayisi, bilgi: String

    enum CodingKeys: String, CodingKey {
        case id
        case seoAdi = "seo_adi"
        case adi, baslik, ikon, gundemSayisi, bilgi
    }
}

// MARK: - AuthorSayfa
struct AuthorSayfa: Codable {
    let sayfa, toplamSayfa: String
}

// MARK: - AuthorUye
struct AuthorUye: Codable {
    let renderTuru, id, adi, kadi: String
    let resim, resimB, kapakResim, kapakResimB: String
    let silinme: String
    let onay, premium: Int
    let okudu: String
    let takipButon: AuthorTakipButon

    enum CodingKeys: String, CodingKey {
        case renderTuru, id, adi, kadi, resim, resimB
        case kapakResim = "kapak_resim"
        case kapakResimB = "kapak_resimB"
        case silinme, onay, premium, okudu, takipButon
    }
}

// MARK: - AuthorTakipButon
struct AuthorTakipButon: Codable {
    let renderTuru, id, turu, mesaj: String
}

// MARK: - AuthorVeri
struct AuthorVeri: Codable {
    let bilgiParse: AuthorParse?
    let siralamalar: [AuthorSiralamalar]?
    let tamadi, sifat, dogum, olum: String?
    let sayilar: [String]?
}

// MARK: - AuthorSiralamalar
struct AuthorSiralamalar: Codable {
    let baslik, siralama, bolum, sirala: String
}

// MARK: - AuthorYazar
struct AuthorYazar: Codable {
    let resimB: String
    let begeniDuz, gosterimDuz, okuduDuz, puanKisiDuz: String
    let begeniButon, takipButon: AuthorBegeniButonClass
    let turler: [AuthorTurler]
    let adi: String
    let enPopulerKitapTuru: String
    let id: Int
    let resim: String
    let seoAdi, okudu, puan: String
    let silinme: Int
    let turlerAdi: AuthorTurlerAdi

    enum CodingKeys: String, CodingKey {
        case resimB, begeniDuz, gosterimDuz, okuduDuz
        case puanKisiDuz = "puan_kisiDuz"
        case begeniButon, takipButon, turler, enPopulerKitapTuru, id, resim,adi
        case seoAdi = "seo_adi"
        case okudu, puan, silinme, turlerAdi
    }
}

// MARK: - AuthorBegeniButonClass
struct AuthorBegeniButonClass: Codable {
    let onay, onayYazisi, link, durum: String
    let bir, iki, birMesaj, ikiMesaj: String
    let birIcon, ikiIcon, disabled: String
}

// MARK: - AuthorTurler
struct AuthorTurler: Codable {
    let baslik: AuthorTurlerAdi
    let filtreBaslik, seo: String
}






