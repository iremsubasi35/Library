//
//  SearchDataController.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

struct SearchDataTransferObject: Identifiable{
    var id: UUID = .init()
    let image: URL?
    let name: String
    let turu : String
    let seoName: String?
    let identifier: String
    let username: String?
}

enum SearchDataControllerState{
    case idle
    case working
}

final class SearchDataController {
    private var cancellables = Set<AnyCancellable>()
    private var apiManager: APIManager
    private (set) var currentState = CurrentValueSubject<SearchDataControllerState,Never>(.idle)
    private (set) var dto = CurrentValueSubject<[SearchDataTransferObject],Never>([])
    private (set) var error = PassthroughSubject<Error?,Never>()
    
    init(apiManager: APIManager) {
            self.apiManager = apiManager
        }
   
func fetchData(with searchText: String) {
    guard currentState.value == .idle else {
        return
    }
    currentState.send(.working)
    
           apiManager.searchRequestData(with: searchText)
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
                       let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                     let searchDataTransferObject =  self.parseData(searchResponse)
                       self.dto.send(searchDataTransferObject)
                   } catch {
                       print("error: \(error)")
                       self.error.send(error)
                   }
               }
               .store(in: &cancellables)
       }
    
    func parseData(_ searchData: SearchResponse) -> [SearchDataTransferObject] {

        let searchDTOs:[SearchDataTransferObject] = searchData.sonuclar.compactMap { result in
            guard let type = result.turu, type != "etiket"
            else {
                return nil
            }
                let imageURL = URL(string: result.icerik?.resim ?? "")
                let name = result.name ?? ""
                let turu = result.turu ?? ""
            let identifier = result.icerik?.id ?? ""
            let seoname = result.icerik?.seoAdi
            let username = result.icerik?.username

                return SearchDataTransferObject(image: imageURL, name: name,
                    turu: turu,
                    seoName: seoname,
                    identifier: identifier,
                    username: username)
            }


            return searchDTOs
    }
 
}

