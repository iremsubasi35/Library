//
//  AuthorDataController.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

final class AuthorDataController:ObservableObject{
    private var cancellables = Set<AnyCancellable>()
    private var apiManager: APIManager
    
    init(apiManager: APIManager) {
            self.apiManager = apiManager
        }
    func fetchData(with searchText: String, completion: @escaping (Result<BookResponse, Error>) -> Void) {

               apiManager.bookRequestData(with: searchText)
                   .sink { completion in
                       switch completion {
                       case .finished:
                           break
                       case .failure(let error):
                           print("Hata oluştu: \(error)")
                       }
                   } receiveValue: { data in
                       do {
                           let searchData = try JSONDecoder().decode(BookResponse.self, from: data)
                           completion(.success(searchData))
                       } catch {
                           completion(.failure(error))
                       }
                   }
                   .store(in: &cancellables)
           }
}
