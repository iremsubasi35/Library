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
    var image: URL
    var name: String
    var job: String
    var userName: String
    var author: String
}

final class SearchViewModel: ObservableObject{
    private var dataController: SearchDataController
    @Published var searchText: String = ""
    @Published var searchResults: [SearchResult] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init(dataController: SearchDataController) {
        self.dataController = dataController
    }
    
    func setupBindings() {
            $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
                .sink { [weak self] searchText in
                    self?.handleSearchTextChange(searchText)
                }
                .store(in: &cancellables)
        }
    
    func handleSearchTextChange(_ searchText: String) {
        dataController.fetchData(searchText: searchText) { result in
            switch result {
            case .success(let data):
                print("Veriler alındı: \(data)")
                let searchResults = self.parseData(data)
                DispatchQueue.main.async {
                    self.searchResults = searchResults
                }
                
            case .failure(let error):
                print("Hata oluştu: \(error)")
                DispatchQueue.main.async {
                    self.searchResults = []
                }
            }
        }
        //    print("Arama metni: \(searchText)")
    }
    
    func parseData(_ data: Data) -> [SearchResult] {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            
            if let results = json as? [[String: Any]] {
                var searchResults: [SearchResult] = []
                
                for result in results {
                    if let type = result["type"] as? String {
                        switch type {
                        case "book":
                            if let title = result["title"] as? String,
                               let writer = result["author"] as? String,
                               let imageURL = result["image"] as? URL {
                                let searchResult = SearchResult(image: imageURL, name: title, job: "", userName: "", author: writer)
                                searchResults.append(searchResult)
                            }
                        case "author":
                            if let name = result["name"] as? String,
                               let job = result["job"] as? String,
                               let imageURL = result["image"] as? URL {
                                let searchResult = SearchResult(image: imageURL, name: name, job: job, userName: "", author: "")
                                searchResults.append(searchResult)
                            }
                        case "reader":
                            if let name = result["name"] as? String,
                               let nickName = result["userName"] as? String,
                                let imageURL = result["image"] as? URL{
                                let searchResult = SearchResult(image: imageURL, name: name, job: "", userName: nickName, author: "")
                                searchResults.append(searchResult)
                            }
                        default:
                            break
                        }
                    }
                }
                
                return searchResults
            }
        } catch {
            print("Error parsing data: \(error)")
        }
        
        return []
    }

    
}
