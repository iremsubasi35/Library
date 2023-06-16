//
//  SearchView.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel: SearchViewModel
        
        init(viewModel: SearchViewModel){
            self.viewModel = viewModel
        }
    var body: some View {
        VStack{
            SearchBar(text: $viewModel.searchText)
                     Text("Aranan kelime: \(viewModel.searchText)")
                         
            Spacer()
        }.padding(.top,16)
            .padding(.horizontal,16)
            
                 .onAppear {
                     viewModel.setupBindings()
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.searchTextField.leftViewMode = .always
        searchBar.searchTextField.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchBar.searchTextField.placeholder = "search in PagePal"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

