//
//  SearchViewModel.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

struct SearchResultPresentation: Identifiable {
    let id: UUID = .init()
    var image: URL? = nil
    var name: String = ""
    var turu: String = ""
}

final class SearchViewModel: ObservableObject {
    private var dataController: SearchDataController
    @Published var searchResults: [SearchResultPresentation] = []
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
        dataController.currentState
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  state in
                guard let self = self else {
                    return
                }
                self.processControlPresentation()
            }
            .store(in: &cancellables)
        dataController.dto
            .receive(on: DispatchQueue.main)
            .sink { [weak self] searchDTOs in
                guard let self = self else { return }
                
                let searchResultPresentations = searchDTOs.map { dto in
                    return SearchResultPresentation(image: dto.image, name: dto.name, turu: dto.turu)
                }
                self.searchResults = searchResultPresentations
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
    }
       
    
    
    private func handleSearchTextChange(_ searchText: String) {
        dataController.fetchData(with: searchText)
    }
    
    func processControlPresentation(){
                if dataController.currentState.value == .working {
                 
                } else {
                  
                }
        }
        
}
