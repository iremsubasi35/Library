//
//  UserDataController.swift
//  PagePal
//
//  Created by İrem Subaşı on 10.07.2023.
//

import Foundation
import Combine

struct UserDataTransferObject: Identifiable {
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
final class UserDataController{
    private var cancellables = Set<AnyCancellable>()
    private var apiManager: APIManager
    private var userId: String
    
    init(apiManager: APIManager, userId: String) {
        self.apiManager = apiManager
        self.userId = userId
    }
}
