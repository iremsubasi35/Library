//
//  BookViewModel.swift
//  PagePal
//
//  Created by Irem Subası on 17.06.2023.
//

import Foundation
import Combine

final class BookViewModel: ObservableObject{
    private var dataController: BookDataController
    
    init(dataController: BookDataController) {
        self.dataController = dataController
    }
}
