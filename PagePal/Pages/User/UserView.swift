//
//  UserView.swift
//  PagePal
//
//  Created by İrem Subaşı on 10.07.2023.
//

import SwiftUI

struct UserView: View {
    @ObservedObject private var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView{
            contentView
        }
    }
}
// MARK: - contentView
extension UserView{
    @ViewBuilder
    private var contentView: some View {
        VStack{
            
        }
    }
}
