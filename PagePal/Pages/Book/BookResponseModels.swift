//
//  BookResponseModels.swift
//  PagePal
//
//  Created by İrem Subaşı on 26.06.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct BookResponse: Codable {
    let kitap: Kitap
    let toplamSayfa, kume, toplamIcerik, sayfa: Int
    let z, b, sayfaBasi: Int
    let gonderiler: [Gonderiler]
    let bilgiMesaji, bilgiYazisi: String
    let bilgi: Int
    let apiSurum: String
    let apiB: Bool
    let apiT: String
    let uye: JSONNull?

    enum CodingKeys: String, CodingKey {
        case kitap, toplamSayfa, kume, toplamIcerik, sayfa, z, b, sayfaBasi, gonderiler, bilgiMesaji, bilgiYazisi, bilgi
        case apiSurum = "_api_surum"
        case apiB = "_api_b"
        case apiT = "_api_t"
        case uye
    }
}

// MARK: - Gonderiler
struct Gonderiler: Codable {
    let renderTuru: String?
    let adsense: Int?
    let clientID, birimKodu, width, height: String?
    let esnek: Bool?
    let hakkinda: Hakkinda?
    let kitaplar: [Kitaplar]?
    let baslik, bolum: String?
    let puanDizisi: [PuanDizisi]?
    let puanKisiDuz: Int?
    let puan: Double?
    let incelemeSayisiDuz: Int?
    let id, turu, icerikid, turualt: String?
    let silinme, islem, tarihsaat, uyeid: String?
    let icerikidalt, begeniSayisi, yorumSayisi, paylasimSayisi: String?
    let konuID: String?
    let yer: RenderTuru?
    let ustID: String?
    let ustIDFarkliMi: Int?
    let menu, paylasMenu: String?
    let analizAcik, analizKanalID: Int?
    let analizID: String?
    let alintiSayisi: Int?
    let uye: Uye?
    let buton: Buton?
    let alt: Alt?
    let govde: [Govde]?
    let govdeSayfa: [GovdeSayfa]?
    let sayfa: Sayfa?
    let konu: Konu?

    enum CodingKeys: String, CodingKey {
        case renderTuru, adsense
        case clientID = "clientId"
        case birimKodu, width, height, esnek, hakkinda, kitaplar, baslik, bolum, puanDizisi
        case puanKisiDuz = "puan_kisiDuz"
        case puan, incelemeSayisiDuz, id, turu, icerikid, turualt, silinme, islem, tarihsaat, uyeid, icerikidalt, begeniSayisi, yorumSayisi, paylasimSayisi
        case konuID = "konuId"
        case yer
        case ustID = "ustId"
        case ustIDFarkliMi = "ustIdFarkliMi"
        case menu
        case paylasMenu = "paylas_menu"
        case analizAcik
        case analizKanalID = "analizKanalId"
        case analizID = "analizId"
        case alintiSayisi, uye, buton, alt, govde, govdeSayfa, sayfa, konu
    }
}

// MARK: - Alt
struct Alt: Codable {
    let yorumlar: Yorumlar
    let kitaplar: Kitaplar
}

// MARK: - Kitaplar
struct Kitaplar: Codable {
    let renderTuru: RenderTuru?
    let id: Int
    let adi: String
    let resim, resimB: String
    let seoAdi, okudu, okuduDuz, ustBaskiID: String
    let silinme, puan, puanKisiDuz: String
    let okumaDurumuButon: OkumaDurumuButon
    let ilkYazar: String?
    let yazarlar: [Yazarlar]?
    let yazarAdi: String?
    let debugSonuclari: [JSONAny]?
    let ekBilgi, gonderiID, b: JSONNull?
    let baskiBilgileri: String?

    enum CodingKeys: String, CodingKey {
        case renderTuru, id, adi, resim, resimB
        case seoAdi = "seo_adi"
        case okudu, okuduDuz
        case ustBaskiID = "ustBaskiId"
        case silinme, puan
        case puanKisiDuz = "puan_kisiDuz"
        case okumaDurumuButon, ilkYazar, yazarlar, yazarAdi, debugSonuclari, ekBilgi
        case gonderiID = "gonderiId"
        case b, baskiBilgileri
    }
}

// MARK: - OkumaDurumuButon
struct OkumaDurumuButon: Codable {
    let yazi: Yazi
    let durum: String
}

enum Yazi: String, Codable {
    case okudum = "Okudum"
    case okuyacaklarımaEkle = "Okuyacaklarıma Ekle"
}

enum RenderTuru: String, Codable {
    case kitap = "kitap"
}

// MARK: - Yazarlar
struct Yazarlar: Codable {
    let id, adi: String
    let resim, resimB: String
    let seoAdi, silinme, puanKisi, puan: String
    let okudu, kitapSayisi, turlerAdi: String
    let kitapYazarTurBaslik: KitapYazarTurBaslik

    enum CodingKeys: String, CodingKey {
        case id, adi, resim, resimB
        case seoAdi = "seo_adi"
        case silinme
        case puanKisi = "puan_kisi"
        case puan, okudu, kitapSayisi, turlerAdi, kitapYazarTurBaslik
    }
}

enum KitapYazarTurBaslik: String, Codable {
    case tasarımcı = "Tasarımcı"
    case yazar = "Yazar"
    case çevirmen = "Çevirmen"
}

// MARK: - Yorumlar
struct Yorumlar: Codable {
    let id, etiketID, islemid, tarihsaat: String
    let yorumParse: Parse

    enum CodingKeys: String, CodingKey {
        case id
        case etiketID = "etiketId"
        case islemid, tarihsaat, yorumParse
    }
}

// MARK: - Parse
struct Parse: Codable {
    let key: String
    let dolu, isUzunKisaltma, isKisaKisaltma: Bool
    let parseKisa: [String]
    let orjParse: [String]?
}

// MARK: - Buton
struct Buton: Codable {
    let begeni, paylas, alintilayarakPaylas: Int
    let kaydetDurum: String
}

// MARK: - Govde
struct Govde: Codable {
    let baslik, islemid: String
}

// MARK: - GovdeSayfa
struct GovdeSayfa: Codable {
    let baslik: String
    let puan: String?
    let max: Int?
    let title: String?
}

// MARK: - Hakkinda
struct Hakkinda: Codable {
    let sayilar: [Sayilar]
    let yas, cinsiyet: [Cinsiyet]
    let siralamalar: [Siralamalar]
    let kidYazi: String
    let kidDizi: [[String: String?]]
    let sayfaDakikaOrani: Double
    let sayfasayisi, orijinaladi, yayinevi: String
    let enUzunSayfa: Int
    let baskiYazi, dil, orijinalDil, ulke: String
    let format, bilgi: String
    let bilgiParse: Parse
    let digerBaskilar: [Kitaplar]
    let alisverisKitap: AlisverisKitap
}

// MARK: - AlisverisKitap
struct AlisverisKitap: Codable {
    let debugSonuclari: [JSONAny]
    let kitap: Kitaplar
    let fiyatlar: [Fiyatlar]
    let magazaMi: Bool
}

// MARK: - Fiyatlar
struct Fiyatlar: Codable {
    let debugSonuclari: [JSONAny]
    let id, siteid: Int
    let stokDurumu: String
    let link: String
    let fiyatSade: Double
    let fiyat, eskiFiyat: String
    let eskiFiyatSade: Double
    let indirimOrani: Int
    let kitap: Kitaplar
    let magaza: Magaza
    let ses: String?
    let sure: String?
}

// MARK: - Magaza
struct Magaza: Codable {
    let debugSonuclari: [JSONAny]
    let id: Int
    let baslik, domain: String
    let silinme, oneCikar: Int
    let indirimAciklamasi: String?
    let yayin: Int
    let sesli: Bool
    let profil: Profil?
}

// MARK: - Profil
struct Profil: Codable {
    let debugSonuclari: [JSONAny]
    let id, adi: String
    let b: JSONNull?
    let kadi: String
    let resim, resimB, kapakResim, kapakResimB: String
    let silinme: String
    let onay, premium: Int
    let okudu: String
    let seniTakipEdiyor: Int?
    let ekBilgi: JSONNull?
    let takipButon: ProfilTakipButon
    let beniEngelledi, engelledimMi, susturdumMu: Int?

    enum CodingKeys: String, CodingKey {
        case debugSonuclari, id, adi, b, kadi, resim, resimB
        case kapakResim = "kapak_resim"
        case kapakResimB = "kapak_resimB"
        case silinme, onay, premium, okudu, seniTakipEdiyor, ekBilgi, takipButon, beniEngelledi, engelledimMi, susturdumMu
    }
}

// MARK: - ProfilTakipButon
struct ProfilTakipButon: Codable {
    let debugSonuclari: [JSONAny]
    let id, turu: String
    let mesaj, takipDurumu: String?
}

// MARK: - Cinsiyet
struct Cinsiyet: Codable {
    let bilgi: String
    let yuzde: Double
}

// MARK: - Sayilar
struct Sayilar: Codable {
    let baslik: String
    let sayi: Int
    let bolum, sirala: String
}

// MARK: - Siralamalar
struct Siralamalar: Codable {
    let baslik, siralama, bolum, sirala: String
    let kitapTuru: KitapTuru?
}

// MARK: - KitapTuru
struct KitapTuru: Codable {
    let id, adi, seoAdi, kitapSayisi: String
    let gosterim: String

    enum CodingKeys: String, CodingKey {
        case id, adi
        case seoAdi = "seo_adi"
        case kitapSayisi, gosterim
    }
}

// MARK: - Konu
struct Konu: Codable {
    let id, seoAdi, adi, baslik: String
    let ikon, gundemSayisi, bilgi: String

    enum CodingKeys: String, CodingKey {
        case id
        case seoAdi = "seo_adi"
        case adi, baslik, ikon, gundemSayisi, bilgi
    }
}

// MARK: - PuanDizisi
struct PuanDizisi: Codable {
    let bilgi: Int
    let yuzde: Double
}

// MARK: - Sayfa
struct Sayfa: Codable {
    let sayfa, toplamSayfa: String
}

// MARK: - Uye
struct Uye: Codable {
    let renderTuru, id, adi, kadi: String
    let resim, resimB, kapakResim, kapakResimB: String
    let silinme: String
    let onay, premium: Int
    let okudu: String
    let takipButon: UyeTakipButon

    enum CodingKeys: String, CodingKey {
        case renderTuru, id, adi, kadi, resim, resimB
        case kapakResim = "kapak_resim"
        case kapakResimB = "kapak_resimB"
        case silinme, onay, premium, okudu, takipButon
    }
}

// MARK: - UyeTakipButon
struct UyeTakipButon: Codable {
    let renderTuru, id, turu, mesaj: String
}

// MARK: - Kitap
struct Kitap: Codable {
    let renderTuru: RenderTuru
    let defaultSirala: String
    let takipDurum: Bool
    let begeniDuz, gosterimDuz, alintiSayisiDuz, incelemeSayisiDuz: Int
    let baskiayi, isbn, baskiyili, baskigunu: String
    let baskiSayisi, id: Int
    let adi: String
    let resim, resimB: String
    let seoAdi, okudu, okuduDuz, ustBaskiID: String
    let silinme, puan, puanKisiDuz: String
    let okumaDurumuButon: OkumaDurumuButon
    let ilkYazar: String
    let yazarlar: [Yazarlar]
    let yazarAdi: String

    enum CodingKeys: String, CodingKey {
        case renderTuru, defaultSirala, takipDurum, begeniDuz, gosterimDuz, alintiSayisiDuz, incelemeSayisiDuz, baskiayi, isbn, baskiyili, baskigunu, baskiSayisi, id, adi, resim, resimB
        case seoAdi = "seo_adi"
        case okudu, okuduDuz
        case ustBaskiID = "ustBaskiId"
        case silinme, puan
        case puanKisiDuz = "puan_kisiDuz"
        case okumaDurumuButon, ilkYazar, yazarlar, yazarAdi
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

