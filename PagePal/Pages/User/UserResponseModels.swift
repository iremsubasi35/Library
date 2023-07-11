//
//  UserResponseModels.swift
//  PagePal
//
//  Created by İrem Subaşı on 10.07.2023.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userResponse = try? JSONDecoder().decode(UserResponse.self, from: jsonData)

import Foundation

// MARK: - UserResponse
class UserResponse: Codable {
    let toplamSayfa, kume, toplamIcerik, sayfa: Int
    let z, b, sayfaBasi: Int
    let gonderiler: [UserGonderiler]
    let okur: UserResponseOkur
    let bilgi: Int
    let bilgiMesaji, apiSurum: String
    let apiB: Bool
    let apiT: String

    enum CodingKeys: String, CodingKey {
        case toplamSayfa, kume, toplamIcerik, sayfa, z, b, sayfaBasi, gonderiler, okur, bilgi, bilgiMesaji
        case apiSurum = "_api_surum"
        case apiB = "_api_b"
        case apiT = "_api_t"
    }

    init(toplamSayfa: Int, kume: Int, toplamIcerik: Int, sayfa: Int, z: Int, b: Int, sayfaBasi: Int, gonderiler: [UserGonderiler], okur: UserResponseOkur, bilgi: Int, bilgiMesaji: String, apiSurum: String, apiB: Bool, apiT: String) {
        self.toplamSayfa = toplamSayfa
        self.kume = kume
        self.toplamIcerik = toplamIcerik
        self.sayfa = sayfa
        self.z = z
        self.b = b
        self.sayfaBasi = sayfaBasi
        self.gonderiler = gonderiler
        self.okur = okur
        self.bilgi = bilgi
        self.bilgiMesaji = bilgiMesaji
        self.apiSurum = apiSurum
        self.apiB = apiB
        self.apiT = apiT
    }
}

// MARK: - UserGonderiler
class UserGonderiler: Codable {
    let id, turu, icerikid, turualt: String?
    let silinme, islem, tarihsaat, uyeid: String?
    let icerikidalt, begeniSayisi, yorumSayisi, paylasimSayisi: String?
    let konuID, yer, ustID: String?
    let ustIDFarkliMi: Int?
    let menu, paylasMenu: String?
    let alintiSayisi: Int?
    let uye: UserUyeClass?
    let buton: UserButon?
    let alt: UserAlt?
    let baslik, ustYazi, ustYaziTuru: String?
    let sabit: Int?
    let renderTuru: String?
    let adsense: Int?
    let clientID, birimKodu, width, height: String?
    let esnek: Bool?
    let yazi: String?
    let sayfa: UserSayfa?
    let veri: [UserUyeClass]?
    let okur: UserUyeClass?
    let govdeSayfa: [UserGovdeSayfa]?

    enum CodingKeys: String, CodingKey {
        case id, turu, icerikid, turualt, silinme, islem, tarihsaat, uyeid, icerikidalt, begeniSayisi, yorumSayisi, paylasimSayisi
        case konuID = "konuId"
        case yer
        case ustID = "ustId"
        case ustIDFarkliMi = "ustIdFarkliMi"
        case menu
        case paylasMenu = "paylas_menu"
        case alintiSayisi, uye, buton, alt, baslik, ustYazi, ustYaziTuru, sabit, renderTuru, adsense
        case clientID = "clientId"
        case birimKodu, width, height, esnek, yazi, sayfa, veri, okur, govdeSayfa
    }

    init(id: String?, turu: String?, icerikid: String?, turualt: String?, silinme: String?, islem: String?, tarihsaat: String?, uyeid: String?, icerikidalt: String?, begeniSayisi: String?, yorumSayisi: String?, paylasimSayisi: String?, konuID: String?, yer: String?, ustID: String?, ustIDFarkliMi: Int?, menu: String?, paylasMenu: String?, alintiSayisi: Int?, uye: UserUyeClass?, buton: UserButon?, alt: UserAlt?, baslik: String?, ustYazi: String?, ustYaziTuru: String?, sabit: Int?, renderTuru: String?, adsense: Int?, clientID: String?, birimKodu: String?, width: String?, height: String?, esnek: Bool?, yazi: String?, sayfa: UserSayfa?, veri: [UserUyeClass]?, okur: UserUyeClass?, govdeSayfa: [UserGovdeSayfa]?) {
        self.id = id
        self.turu = turu
        self.icerikid = icerikid
        self.turualt = turualt
        self.silinme = silinme
        self.islem = islem
        self.tarihsaat = tarihsaat
        self.uyeid = uyeid
        self.icerikidalt = icerikidalt
        self.begeniSayisi = begeniSayisi
        self.yorumSayisi = yorumSayisi
        self.paylasimSayisi = paylasimSayisi
        self.konuID = konuID
        self.yer = yer
        self.ustID = ustID
        self.ustIDFarkliMi = ustIDFarkliMi
        self.menu = menu
        self.paylasMenu = paylasMenu
        self.alintiSayisi = alintiSayisi
        self.uye = uye
        self.buton = buton
        self.alt = alt
        self.baslik = baslik
        self.ustYazi = ustYazi
        self.ustYaziTuru = ustYaziTuru
        self.sabit = sabit
        self.renderTuru = renderTuru
        self.adsense = adsense
        self.clientID = clientID
        self.birimKodu = birimKodu
        self.width = width
        self.height = height
        self.esnek = esnek
        self.yazi = yazi
        self.sayfa = sayfa
        self.veri = veri
        self.okur = okur
        self.govdeSayfa = govdeSayfa
    }
}

// MARK: - UserAlt
class UserAlt: Codable {
    let duvar: UserDuvar?
    let kitaplar: UserKitap?

    init(duvar: UserDuvar?, kitaplar: UserKitap?) {
        self.duvar = duvar
        self.kitaplar = kitaplar
    }
}

// MARK: - UserDuvar
class UserDuvar: Codable {
    let id, etiketID: String
    let durumParse: UserDurumParse

    enum CodingKeys: String, CodingKey {
        case id
        case etiketID = "etiketId"
        case durumParse
    }

    init(id: String, etiketID: String, durumParse: UserDurumParse) {
        self.id = id
        self.etiketID = etiketID
        self.durumParse = durumParse
    }
}

// MARK: - UserDurumParse
class UserDurumParse: Codable {
    let parse: [UserDurumParseParse]
    let isUzunKisaltma, isKisaKisaltma: Bool
    let key: String
    let dolu: Bool

    init(parse: [UserDurumParseParse], isUzunKisaltma: Bool, isKisaKisaltma: Bool, key: String, dolu: Bool) {
        self.parse = parse
        self.isUzunKisaltma = isUzunKisaltma
        self.isKisaKisaltma = isKisaKisaltma
        self.key = key
        self.dolu = dolu
    }
}

enum UserDurumParseParse: Codable {
    case string(String)
    case userPurpleParse(UserPurpleParse)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(UserPurpleParse.self) {
            self = .userPurpleParse(x)
            return
        }
        throw DecodingError.typeMismatch(UserDurumParseParse.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for UserDurumParseParse"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .userPurpleParse(let x):
            try container.encode(x)
        }
    }
}

// MARK: - UserPurpleParse
class UserPurpleParse: Codable {
    let type, id: String
    let item: UserItem

    init(type: String, id: String, item: UserItem) {
        self.type = type
        self.id = id
        self.item = item
    }
}

// MARK: - UserItem
class UserItem: Codable {
    let id: Int
    let adi: String
    let resim: String
    let seoAdi: String

    enum CodingKeys: String, CodingKey {
        case id, adi, resim
        case seoAdi = "seo_adi"
    }

    init(id: Int, adi: String, resim: String, seoAdi: String) {
        self.id = id
        self.adi = adi
        self.resim = resim
        self.seoAdi = seoAdi
    }
}

// MARK: - UserKitap
class UserKitap: Codable {
    let renderTuru: UserKitaplarRenderTuru
    let id: Int
    let adi: String
    let resim, resimB: String
    let seoAdi, okudu, okuduDuz, ustBaskiID: String
    let silinme, puan, puanKisiDuz: String
    let okumaDurumuButon: UserOkumaDurumuButon
    let ilkYazar: String
    let yazarlar: [UserYazarlar]
    let yazarAdi: String

    enum CodingKeys: String, CodingKey {
        case renderTuru, id, adi, resim, resimB
        case seoAdi = "seo_adi"
        case okudu, okuduDuz
        case ustBaskiID = "ustBaskiId"
        case silinme, puan
        case puanKisiDuz = "puan_kisiDuz"
        case okumaDurumuButon, ilkYazar, yazarlar, yazarAdi
    }

    init(renderTuru: UserKitaplarRenderTuru, id: Int, adi: String, resim: String, resimB: String, seoAdi: String, okudu: String, okuduDuz: String, ustBaskiID: String, silinme: String, puan: String, puanKisiDuz: String, okumaDurumuButon: UserOkumaDurumuButon, ilkYazar: String, yazarlar: [UserYazarlar], yazarAdi: String) {
        self.renderTuru = renderTuru
        self.id = id
        self.adi = adi
        self.resim = resim
        self.resimB = resimB
        self.seoAdi = seoAdi
        self.okudu = okudu
        self.okuduDuz = okuduDuz
        self.ustBaskiID = ustBaskiID
        self.silinme = silinme
        self.puan = puan
        self.puanKisiDuz = puanKisiDuz
        self.okumaDurumuButon = okumaDurumuButon
        self.ilkYazar = ilkYazar
        self.yazarlar = yazarlar
        self.yazarAdi = yazarAdi
    }
}

// MARK: - UserOkumaDurumuButon
class UserOkumaDurumuButon: Codable {
    let yazi: UserYazi
    let durum: String

    init(yazi: UserYazi, durum: String) {
        self.yazi = yazi
        self.durum = durum
    }
}

enum UserYazi: String, Codable {
    case okuyacaklarımaEkle = "Okuyacaklarıma Ekle"
}

enum UserKitaplarRenderTuru: String, Codable {
    case kitap = "kitap"
}

// MARK: - UserYazarlar
class UserYazarlar: Codable {
    let id, adi: String
    let resim, resimB: String
    let seoAdi, silinme, puanKisi, puan: String
    let okudu, kitapSayisi, turlerAdi: String
    let kitapYazarTurBaslik: UserKitapYazarTurBaslik

    enum CodingKeys: String, CodingKey {
        case id, adi, resim, resimB
        case seoAdi = "seo_adi"
        case silinme
        case puanKisi = "puan_kisi"
        case puan, okudu, kitapSayisi, turlerAdi, kitapYazarTurBaslik
    }

    init(id: String, adi: String, resim: String, resimB: String, seoAdi: String, silinme: String, puanKisi: String, puan: String, okudu: String, kitapSayisi: String, turlerAdi: String, kitapYazarTurBaslik: UserKitapYazarTurBaslik) {
        self.id = id
        self.adi = adi
        self.resim = resim
        self.resimB = resimB
        self.seoAdi = seoAdi
        self.silinme = silinme
        self.puanKisi = puanKisi
        self.puan = puan
        self.okudu = okudu
        self.kitapSayisi = kitapSayisi
        self.turlerAdi = turlerAdi
        self.kitapYazarTurBaslik = kitapYazarTurBaslik
    }
}

enum UserKitapYazarTurBaslik: String, Codable {
    case yazar = "Yazar"
    case çevirmen = "Çevirmen"
}

// MARK: - UserButon
class UserButon: Codable {
    let begeni: Int
    let paylas, alintilayarakPaylas: Int?
    let kaydetDurum: String?
    let paylasDisable: Int?

    init(begeni: Int, paylas: Int?, alintilayarakPaylas: Int?, kaydetDurum: String?, paylasDisable: Int?) {
        self.begeni = begeni
        self.paylas = paylas
        self.alintilayarakPaylas = alintilayarakPaylas
        self.kaydetDurum = kaydetDurum
        self.paylasDisable = paylasDisable
    }
}

// MARK: - UserGovdeSayfa
class UserGovdeSayfa: Codable {
    let baslik: String
    let title: String?

    init(baslik: String, title: String?) {
        self.baslik = baslik
        self.title = title
    }
}

// MARK: - UserUyeClass
class UserUyeClass: Codable {
    let renderTuru: UserOkurRenderTuru
    let id, adi, kadi: String
    let resim, resimB, kapakResim, kapakResimB: String
    let silinme: String
    let onay, premium: Int
    let okudu: String
    let takipButon: UserTakipButon
    let ekBilgi: String?

    enum CodingKeys: String, CodingKey {
        case renderTuru, id, adi, kadi, resim, resimB
        case kapakResim = "kapak_resim"
        case kapakResimB = "kapak_resimB"
        case silinme, onay, premium, okudu, takipButon, ekBilgi
    }

    init(renderTuru: UserOkurRenderTuru, id: String, adi: String, kadi: String, resim: String, resimB: String, kapakResim: String, kapakResimB: String, silinme: String, onay: Int, premium: Int, okudu: String, takipButon: UserTakipButon, ekBilgi: String?) {
        self.renderTuru = renderTuru
        self.id = id
        self.adi = adi
        self.kadi = kadi
        self.resim = resim
        self.resimB = resimB
        self.kapakResim = kapakResim
        self.kapakResimB = kapakResimB
        self.silinme = silinme
        self.onay = onay
        self.premium = premium
        self.okudu = okudu
        self.takipButon = takipButon
        self.ekBilgi = ekBilgi
    }
}

enum UserOkurRenderTuru: String, Codable {
    case okur = "okur"
}

// MARK: - UserTakipButon
class UserTakipButon: Codable {
    let renderTuru: UserTakipButonRenderTuru
    let id: String
    let turu: UserTuru
    let mesaj: UserMesaj

    init(renderTuru: UserTakipButonRenderTuru, id: String, turu: UserTuru, mesaj: UserMesaj) {
        self.renderTuru = renderTuru
        self.id = id
        self.turu = turu
        self.mesaj = mesaj
    }
}

enum UserMesaj: String, Codable {
    case girişYapmalısınız = "Giriş yapmalısınız."
}

enum UserTakipButonRenderTuru: String, Codable {
    case okurTakipButon = "okurTakipButon"
}

enum UserTuru: String, Codable {
    case hata = "hata"
}

// MARK: - UserSayfa
class UserSayfa: Codable {
    let sayfa, toplamSayfa: String

    init(sayfa: String, toplamSayfa: String) {
        self.sayfa = sayfa
        self.toplamSayfa = toplamSayfa
    }
}

// MARK: - UserResponseOkur
class UserResponseOkur: Codable {
    let renderTuru, id, adi, kadi: String
    let resim, resimB, kapakResim, kapakResimB: String
    let silinme: String
    let onay, premium: Int
    let okudu: String
    let takipButon: UserTakipButon
    let defaultSirala: String
    let bilgiler: [UserBilgiler]
    let okurPuani: Int
    let okuduDuz, takipciSayisiDuz, takipEttigiSayisiDuz, alintiSayisiDuz: String
    let iletiSayisiDuz, incelemeSayisiDuz: String
    let suAndaOkuyor: UserSuAndaOkuyor
    let bilgiParse: UserBilgiParse
    let noIndex, isSikiOkur, isYeniOkur: Bool
    let hedefler: [UserHedefler]

    enum CodingKeys: String, CodingKey {
        case renderTuru, id, adi, kadi, resim, resimB
        case kapakResim = "kapak_resim"
        case kapakResimB = "kapak_resimB"
        case silinme, onay, premium, okudu, takipButon, defaultSirala, bilgiler, okurPuani, okuduDuz, takipciSayisiDuz, takipEttigiSayisiDuz, alintiSayisiDuz, iletiSayisiDuz, incelemeSayisiDuz, suAndaOkuyor, bilgiParse, noIndex, isSikiOkur, isYeniOkur, hedefler
    }

    init(renderTuru: String, id: String, adi: String, kadi: String, resim: String, resimB: String, kapakResim: String, kapakResimB: String, silinme: String, onay: Int, premium: Int, okudu: String, takipButon: UserTakipButon, defaultSirala: String, bilgiler: [UserBilgiler], okurPuani: Int, okuduDuz: String, takipciSayisiDuz: String, takipEttigiSayisiDuz: String, alintiSayisiDuz: String, iletiSayisiDuz: String, incelemeSayisiDuz: String, suAndaOkuyor: UserSuAndaOkuyor, bilgiParse: UserBilgiParse, noIndex: Bool, isSikiOkur: Bool, isYeniOkur: Bool, hedefler: [UserHedefler]) {
        self.renderTuru = renderTuru
        self.id = id
        self.adi = adi
        self.kadi = kadi
        self.resim = resim
        self.resimB = resimB
        self.kapakResim = kapakResim
        self.kapakResimB = kapakResimB
        self.silinme = silinme
        self.onay = onay
        self.premium = premium
        self.okudu = okudu
        self.takipButon = takipButon
        self.defaultSirala = defaultSirala
        self.bilgiler = bilgiler
        self.okurPuani = okurPuani
        self.okuduDuz = okuduDuz
        self.takipciSayisiDuz = takipciSayisiDuz
        self.takipEttigiSayisiDuz = takipEttigiSayisiDuz
        self.alintiSayisiDuz = alintiSayisiDuz
        self.iletiSayisiDuz = iletiSayisiDuz
        self.incelemeSayisiDuz = incelemeSayisiDuz
        self.suAndaOkuyor = suAndaOkuyor
        self.bilgiParse = bilgiParse
        self.noIndex = noIndex
        self.isSikiOkur = isSikiOkur
        self.isYeniOkur = isYeniOkur
        self.hedefler = hedefler
    }
}

// MARK: - UserBilgiParse
class UserBilgiParse: Codable {
    let parse: [UserBilgiParseParse]
    let isUzunKisaltma, isKisaKisaltma: Bool
    let key: String
    let dolu: Bool

    init(parse: [UserBilgiParseParse], isUzunKisaltma: Bool, isKisaKisaltma: Bool, key: String, dolu: Bool) {
        self.parse = parse
        self.isUzunKisaltma = isUzunKisaltma
        self.isKisaKisaltma = isKisaKisaltma
        self.key = key
        self.dolu = dolu
    }
}

enum UserBilgiParseParse: Codable {
    case string(String)
    case userFluffyParse(UserFluffyParse)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(UserFluffyParse.self) {
            self = .userFluffyParse(x)
            return
        }
        throw DecodingError.typeMismatch(UserBilgiParseParse.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for UserBilgiParseParse"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .userFluffyParse(let x):
            try container.encode(x)
        }
    }
}

// MARK: - UserFluffyParse
class UserFluffyParse: Codable {
    let type: String
    let id: String
    let item: String

    init(type: String, id: String, item: String) {
        self.type = type
        self.id = id
        self.item = item
    }
}

// MARK: - UserBilgiler
class UserBilgiler: Codable {
    let yazi: String
    let kilit: UserKilit?
    let icon: String

    init(yazi: String, kilit: UserKilit?, icon: String) {
        self.yazi = yazi
        self.kilit = kilit
        self.icon = icon
    }
}

enum UserKilit: Codable {
    case bool(Bool)
    case integer(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        throw DecodingError.typeMismatch(UserKilit.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for UserKilit"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        }
    }
}

// MARK: - UserHedefler
class UserHedefler: Codable {
    let renderTuru: String
    let sene, hedef, okudu: Int
    let islemid, kalanGun: String
    let edit: Bool
    let uyeid, id: String

    init(renderTuru: String, sene: Int, hedef: Int, okudu: Int, islemid: String, kalanGun: String, edit: Bool, uyeid: String, id: String) {
        self.renderTuru = renderTuru
        self.sene = sene
        self.hedef = hedef
        self.okudu = okudu
        self.islemid = islemid
        self.kalanGun = kalanGun
        self.edit = edit
        self.uyeid = uyeid
        self.id = id
    }
}

// MARK: - UserSuAndaOkuyor
class UserSuAndaOkuyor: Codable {
    let sayi: String
    let liste: [UserListe]

    init(sayi: String, liste: [UserListe]) {
        self.sayi = sayi
        self.liste = liste
    }
}

// MARK: - UserListe
class UserListe: Codable {
    let kitap: UserKitap
    let sayfa: String
    let yuzde: Double
    let gonderiID: String

    enum CodingKeys: String, CodingKey {
        case kitap, sayfa, yuzde
        case gonderiID = "gonderiId"
    }

    init(kitap: UserKitap, sayfa: String, yuzde: Double, gonderiID: String) {
        self.kitap = kitap
        self.sayfa = sayfa
        self.yuzde = yuzde
        self.gonderiID = gonderiID
    }
}



