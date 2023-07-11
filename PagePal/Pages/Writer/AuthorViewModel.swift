//
//  AuthorViewModel.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

struct AuthorPresentation: Identifiable {
    let id: UUID = .init()
    let name: String 
    let image: URL?
    let job: String
    let puan: String
    let puankisi: String
    let okunan: String
    let begeni: String
    let gosterim: String
    let aciklama: String
    let unvanSıfat: String
    let dogum: String
    let olum : String
}
final class AuthorViewModel: ObservableObject{
    private var dataController: AuthorDataController
    private var cancellables = Set<AnyCancellable>()
    
    @Published var authorPresentation: AuthorPresentation?
    @Published var checkProcess: Bool = false
    
    init(dataController: AuthorDataController) {
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
                self.progessControlPresentation()
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
            .compactMap { authorDTO -> AuthorPresentation? in
                guard let authorDTO = authorDTO else {
                    return nil
                }
                
                return AuthorPresentation(name: authorDTO.name,
                                          image: authorDTO.image,
                                          job: authorDTO.job,
                                          puan: authorDTO.puan,
                                          puankisi: authorDTO.puankisi,
                                          okunan: authorDTO.okunan,
                                          begeni: authorDTO.begeni,
                                          gosterim: authorDTO.gosterim,
                                          aciklama: authorDTO.aciklama,
                                          unvanSıfat: authorDTO.unvanSıfat,
                                          dogum: authorDTO.dogum,
                                          olum: authorDTO.olum)
            }
            .sink { [weak self] authorPresentation in
           //     print(authorPresentation)
                self?.authorPresentation = authorPresentation
            }
            .store(in: &cancellables)
    }
    
    func progessControlPresentation(){
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
