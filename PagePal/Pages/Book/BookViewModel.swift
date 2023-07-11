//
//  BookViewModel.swift
//  PagePal
//
//  Created by Irem Subası on 17.06.2023.
//

import Foundation
import Combine

struct BookPresentation: Identifiable{
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

final class BookViewModel: ObservableObject{
    private var dataController: BookDataController
    @Published var bookPresentation: BookPresentation?
    @Published var checkProcess: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(dataController: BookDataController) {
        self.dataController = dataController
        setupBindings()
    }
    
    private func setupBindings(){
        dataController.currentState
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  state in
                guard let self = self else {
                    return
                }
                self.processControlPresentation()
            }
            .store(in: &cancellables)
        dataController.error
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                guard let self = self else {
                    return
                }
            }
            .store(in: &cancellables)
        dataController.dto
            .receive(on: DispatchQueue.main)
            .compactMap { bookDTO -> BookPresentation? in
                guard let bookDTO = bookDTO else {
                    return nil
                }
                return BookPresentation(bookImage: bookDTO.bookImage,
                                        bookName: bookDTO.bookName, bookAuthor: bookDTO.bookAuthor, score: bookDTO.score, pointPerson: bookDTO.pointPerson, read: bookDTO.read, likes: bookDTO.likes, impression: bookDTO.impression, kind: bookDTO.kind, pageNumber: bookDTO.pageNumber, originalName: bookDTO.originalName, authorImage: bookDTO.authorImage, translatorName: bookDTO.translatorName, translatorImage: bookDTO.translatorImage, explanation: bookDTO.explanation)
            }
            .sink { [weak self] bookPresentation in
                print(bookPresentation)
                self?.bookPresentation = bookPresentation
            }
            .store(in: &cancellables)
    }
    
     private func processControlPresentation(){
                if dataController.currentState.value == .working {
                    checkProcess = true
                } else {
                    checkProcess = false
                }
        }
    
    func getData(){
        dataController.fetchData()
    }
    
}
