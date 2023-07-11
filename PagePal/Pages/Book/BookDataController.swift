//
//  BookDataController.swift
//  PagePal
//
//  Created by Irem Subası on 17.06.2023.
//

import Foundation
import Combine
struct BookDataTransferObject: Identifiable{
    let id: UUID = .init()
    let bookImage: URL?
    let bookName: String
    let bookAuthor: String
    let score: String
    let pointPerson: String
    let read: String
    let likes: String
    let impression: String
    let kind: String
    let pageNumber: String
    let originalName: String?
    let authorImage: URL?
    let translatorName: String?
    let translatorImage: URL?
    let explanation: String
}
final class BookDataController: ObservableObject{
    private var cancellables = Set<AnyCancellable>()
    private (set) var dto = CurrentValueSubject<BookDataTransferObject?,Never>(nil)
    private (set) var currentState = CurrentValueSubject<SearchDataControllerState,Never>(.idle)
    private (set) var error = PassthroughSubject<Error?,Never>()
    private var apiManager: APIManager
    private var bookId: String
    
    init( apiManager: APIManager, bookId: String) {
        self.apiManager = apiManager
        self.bookId = bookId
    }
    
    func fetchData() {
        guard currentState.value == .idle else {
            return
        }
        currentState.send(.working)
        
        apiManager.bookRequestData(with: bookId)
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
                    let bookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
                  let bookDataTransferObject =  self.bookParseData(bookResponse)
                    self.dto.send(bookDataTransferObject)
                } catch {
                    print("error: \(error)")
                    self.error.send(error)
                }
            }
            .store(in: &cancellables)
           }
    
    func bookParseData(_ bookData: BookResponse) -> BookDataTransferObject {
        
        let bookImage = URL(string: bookData.kitap.resim)
        let bookName = bookData.kitap.adi
        let bookAuthor = bookData.kitap.yazarAdi
        let score = bookData.kitap.puan
        let point = bookData.kitap.puanKisiDuz
        let read = bookData.kitap.okudu
        let likes = String(bookData.kitap.begeniDuz)
        let impression = String(bookData.kitap.gosterimDuz)
        let pageNumber = bookData.gonderiler[1].hakkinda?.sayfasayisi ?? ""
        let kind = bookData.gonderiler[1].hakkinda?.kidYazi ?? ""
        let explantion = bookData.gonderiler[1].hakkinda?.bilgiParse.orjParse?.first ?? ""
        let originalName = bookData.gonderiler[1].hakkinda?.orijinaladi ?? ""
        let authorImage = URL(string: bookData.kitap.yazarlar.first?.resim ?? "")
        let translatorName = bookData.kitap.yazarlar[1].adi ?? ""
        let translatorImage = URL(string: bookData.kitap.yazarlar[1].resim)
        
           
        
        return .init(bookImage: bookImage,
                     bookName: bookName,
                     bookAuthor: bookAuthor,
                     score: score,
                     pointPerson: point,
                     read: read,
                     likes: likes,
                     impression: impression,
                     kind: kind,
                     pageNumber: pageNumber,
                     originalName: originalName,
                     authorImage: authorImage,
                     translatorName: translatorName,
                     translatorImage: translatorImage,
                     explanation: explantion)
    }
}
