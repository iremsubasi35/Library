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
            dataController.fetchDataa(with: searchText) { [weak self] result in
                switch result {
                case .success(let data):
                    do {
                        let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                        DispatchQueue.main.async {
                            if let firstResult = searchResponse.sonuclar.first {
                                self?.searchResults = [SearchResult(image: URL(string: firstResult.icerik?.resim ?? ""),
                                                                  name: firstResult.name ?? "",
                                                                  turu: firstResult.turu ?? "")]
                            } else {
                                self?.searchResults = []
                            }
                        }
                    } catch {
                        print("JSON decode hatası: \(error.localizedDescription)")
                        DispatchQueue.main.async {
                            self?.searchResults = []
                        }
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
