//
//  AuthorViewModel.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

final class AuthorViewModel: ObservableObject{
    private var dataController: AuthorDataController
    init(dataController: AuthorDataController) {
        self.dataController = dataController
    }
    
}
