//
//  AuthorDataController.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

struct AuthorDataTransferObject: Identifiable {
    let id: UUID = .init()
    let name: String
    let image: URL?
    let job: String
    let puan: String
    let puankisi: String
    let okunan: String
    let begeni: String
    let gosterim: String
    let aciklama: String
    let unvanSıfat: String
    let dogum: String
    let olum : String
}

final class AuthorDataController:ObservableObject{
    private var cancellables = Set<AnyCancellable>()
    private var apiManager: APIManager
    private var authorId: String
    private (set) var dto = CurrentValueSubject<AuthorDataTransferObject?,Never>(nil)
    private (set) var currentState = CurrentValueSubject<SearchDataControllerState,Never>(.idle)
    private (set) var error = PassthroughSubject<Error?,Never>()
    
    init(apiManager: APIManager, authorId: String) {
        self.apiManager = apiManager
        self.authorId = authorId
    }


    func fetchData() {
        guard currentState.value == .idle else {
            return
        }
        currentState.send(.working)
        
        apiManager.authorRequestData(with: authorId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.currentState.send(.idle)
                case .failure(let error):
                    self?.error.send(error)
                    print("Hata oluştu: \(error)")
                }
            } receiveValue: { data in
                do {
                    let authorResponse = try JSONDecoder().decode(AuthorResponse.self, from: data)
                  let authorDataTransferObject =  self.authorParseData(authorResponse)
                    self.dto.send(authorDataTransferObject)
                } catch {
                    print("error: \(error)")
                    self.error.send(error)
                }
            }
            .store(in: &cancellables)
           }
    
    func authorParseData(_ authorhData: AuthorResponse)-> AuthorDataTransferObject {


        let name = authorhData.yazar.adi
        let imageURL = URL(string: authorhData.yazar.resim)
        let job = authorhData.yazar.turlerAdi
        let puan = authorhData.yazar.puan
        let puanKisi = authorhData.yazar.puanKisiDuz
        let okunan = authorhData.yazar.okuduDuz
        let begeni = authorhData.yazar.begeniDuz
        let gosterim = authorhData.yazar.gosterimDuz
        let aciklama = authorhData.gonderiler[1].veri?.bilgiParse?.orjParse?.first ?? ""
        let dogum = authorhData.gonderiler[1].veri?.dogum ?? ""
        let olum = authorhData.gonderiler[1].veri?.olum ?? ""
        let sifat = authorhData.gonderiler[1].veri?.sifat ?? ""
        
    
        return .init(name: name,
                     image: imageURL,
                     job: job.rawValue,
                     puan: puan,
                     puankisi: puanKisi,
                     okunan: okunan,
                     begeni: begeni,
                     gosterim: gosterim,
                     aciklama: aciklama,
                     unvanSıfat: sifat,
                     dogum: dogum,
                     olum: olum)
    }
}
