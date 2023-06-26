//
//  SearchDataController.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

final class SearchDataController: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
   
func fetchData(with searchText: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
           let apiManager = APIManager()

           apiManager.searchRequestData(with: searchText)
               .sink { completion in
                   switch completion {
                   case .finished:
                       break
                   case .failure(let error):
                       print("Hata oluştu: \(error)")
                   }
               } receiveValue: { data in
                   do {
                       let searchData = try JSONDecoder().decode(SearchResponse.self, from: data)
                       completion(.success(searchData))
                   } catch {
                       completion(.failure(error))
                   }
               }
               .store(in: &cancellables)
       }
    
        func parseData(_ searchData: SearchResponse) -> [SearchResult] {
            return searchData.sonuclar.map { result in
                return SearchResult(image: URL(string: result.icerik?.resim ?? ""),
                                    name: result.name ?? "",
                                    turu: result.turu ?? "")
            }
        }
}

