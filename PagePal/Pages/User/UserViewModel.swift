//
//  UserViewModel.swift
//  PagePal
//
//  Created by İrem Subaşı on 10.07.2023.
//

import Foundation
import Combine

struct UserPresentation: Identifiable{
    let id: UUID = .init()
    let userName: String
    let image: URL?
    let coverImage: URL?
    let name: String
    let explanation: String
    let follower: String
    let follow: String
    let analysis: String
    let excerpt: String
    let post: String
}

final class UserViewModel: ObservableObject{
    
    private var dataController: UserDataController
    private var cancellables = Set<AnyCancellable>()
    
    init(dataController: UserDataController) {
        self.dataController = dataController
        addListeners()
    }
    
    private func addListeners(){
        
    }
}
