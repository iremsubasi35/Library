//
//  PagePalApp.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import SwiftUI

@main
struct PagePalApp: App {
    private let searchView: SearchView = {
        let dataController = SearchDataController(apiManager: APIManager())
            let viewModel = SearchViewModel(dataController: dataController)
            let view = SearchView(viewModel: viewModel)
            return view
        }()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                searchView
            }
        }
    }
}
