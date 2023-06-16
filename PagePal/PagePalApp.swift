//
//  PagePalApp.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import SwiftUI

@main
struct PagePalApp: App {
    private let searchView: BookView = {
            let dataController = BookDataController()
            let viewModel = BookViewModel(dataController: dataController)
            let view = BookView(viewModel: viewModel)
            return view
        }()
    var body: some Scene {
        WindowGroup {
            searchView
        }
    }
}
