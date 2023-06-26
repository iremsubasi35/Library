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
    var bookImage: URL? = nil
    var bookName: String = ""
    var bookAuthor: String = ""
    var score: String = ""
    var valuation: String = ""
    var read: String = ""
    var likes: Int = 0
    var impression: Int = 0
    var pageNumber: String = ""
    var originalName: String = ""
    var authorImage: URL? = nil
    var translatorName: String = ""
    var translatorImage: URL? = nil
    var explanation: String = ""
}

final class BookViewModel: ObservableObject{
    private var dataController: BookDataController
    @Published var bookPresentation: BookPresentation = .init()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(dataController: BookDataController) {
        self.dataController = dataController
    }
}
