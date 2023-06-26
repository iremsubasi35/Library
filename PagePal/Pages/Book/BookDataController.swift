//
//  BookDataController.swift
//  PagePal
//
//  Created by Irem Subası on 17.06.2023.
//

import Foundation
import Combine

final class BookDataController: ObservableObject{
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
    
    func parseData(_ bookPresentationData: BookResponse) -> BookPresentation {
        var presentation = BookPresentation()
        presentation.bookImage = URL(string: bookPresentationData.kitap.resim) 
        presentation.bookName = bookPresentationData.kitap.adi
        presentation.bookAuthor = bookPresentationData.kitap.yazarAdi
        presentation.score = bookPresentationData.kitap.puan
        presentation.valuation = bookPresentationData.kitap.puanKisiDuz
        presentation.read = bookPresentationData.kitap.okudu
        presentation.likes = bookPresentationData.kitap.begeniDuz
        presentation.impression = bookPresentationData.kitap.gosterimDuz
        
        if let gonderi = bookPresentationData.gonderiler.first,
           let hakkinda = gonderi.hakkinda {
            presentation.pageNumber = hakkinda.sayfasayisi
            presentation.originalName = hakkinda.orijinaladi
            presentation.explanation = hakkinda.bilgi
        }
//        if let information = bookPresentationData.gonderiler.first,
//           let yazarlar = bookPresentationData.kitap.yazarlar.first{
//            let yazar = bookPresentationData.kitap.yazarlar[1]
//            if let name = bookPresentationData.kitap.yazarlar[1].adi,
//               let image = bookPresentationData.kitap.yazarlar[1].resim{
//                presentation.translatorName = name
//                presentation.translatorImage = URL(string: image)
//            }
//        }
           
        
        return presentation
    }
}
