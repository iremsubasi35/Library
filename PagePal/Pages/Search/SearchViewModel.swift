//
//  SearchViewModel.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

struct SearchResult: Identifiable {
    let id: UUID = .init()
    var image: URL? = nil
    var name: String = ""
    var turu: String = ""
}

final class SearchViewModel: ObservableObject {
    private var dataController: SearchDataController
    @Published var searchResults: [SearchResult] = []
    @Published var searchText: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(dataController: SearchDataController) {
        self.dataController = dataController
        setupBindings()
    }
    
    private func setupBindings() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.handleSearchTextChange(searchText)
            }
            .store(in: &cancellables)
    }
    
    private func handleSearchTextChange(_ searchText: String) {
        dataController.fetchData(with: searchText) { [weak self] result in
            switch result {
            case .success(let searchData):
                DispatchQueue.main.async {
                    let searchResults = self!.dataController.parseData(searchData) //should be optional
                    self?.searchResults = searchResults
                }
            case .failure(let error):
                print("Hata oluştu: \(error)")
                DispatchQueue.main.async {
                    self?.searchResults = []
                }
            }
        }
    }

}
