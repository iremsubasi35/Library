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
                       self.error.send(error)
                   }
               }
               .store(in: &cancellables)
       }
    
    func parseData(_ searchData: SearchResponse) -> [SearchDataTransferObject] {
        
        let searchDTOs = searchData.sonuclar.compactMap { result in
                let imageURL = URL(string: result.icerik?.resim ?? "")
                let name = result.name ?? ""
                let turu = result.turu ?? ""
                
                return SearchDataTransferObject(image: imageURL, name: name, turu: turu)
            }
            
            
            return searchDTOs
    }

}

