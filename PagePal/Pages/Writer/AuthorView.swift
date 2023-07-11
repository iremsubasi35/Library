//
//  AuthorView.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import SwiftUI

struct AuthorView: View {
    @ObservedObject private var viewModel: AuthorViewModel
    
    init(viewModel: AuthorViewModel){
            self.viewModel = viewModel
        }
    var body: some View {
        ZStack{
            if viewModel.checkProcess {
                ProgressView()
            } else {
                ScrollView{
                    contentView
                }
            }
        }
        .onAppear{
            viewModel.getData()
        }
    }
}

// MARK: - Content View
extension AuthorView{
    @ViewBuilder
    private var contentView: some View{
        VStack{
            informationOfAuthor
            popularityOfAuthor
            aboutAuthor
        }
    }
}
// MARK: - informationOfAuthor
extension AuthorView {
    @ViewBuilder
    private var informationOfAuthor: some View {
        if let presentation = viewModel.authorPresentation{
            HStack{
                AsyncImage(url: presentation.image) { image in
                    image.image?
                        .resizable()
                }
                    .frame(width: 90,height: 120) //fix
                VStack{
                    HStack{
                        Text(presentation.name).bold()
                        Spacer()
                    }
                    HStack{
                        Text(presentation.job)
                            .background(Color.red)
                            .foregroundColor(Color.white)
//                        Text("Çevirmen")
//                            .background(Color.red)
//                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }
            }.padding(.horizontal,24)
                .padding(.top,16)
        }
    }
}
// MARK: - popularityOfAuthor
extension AuthorView{
    @ViewBuilder
    private var popularityOfAuthor: some View {
        if let presentation = viewModel.authorPresentation{
            HStack{
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.black)
                    VStack{
                        Text(presentation.puan ).bold()
                        Text(presentation.puankisi)
                            .font(.system(size: 12))
                    }
                }
                Text("|")
                HStack{
                    Image(systemName: "book.fill")
                        .foregroundColor(Color.black)
                    VStack{
                        Text(presentation.okunan).bold()
                        Text("okunma")
                            .font(.system(size: 12))
                    }
                }
                Text("|")
                HStack{
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color.black)
                    VStack{
                        Text(presentation.begeni).bold()
                        Text("beğenme")
                            .font(.system(size: 12))
                    }
                }
                Text("|")
                HStack{
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color.black)
                    VStack{
                        Text(presentation.gosterim).bold()
                        Text("gösterim")
                            .font(.system(size: 12))
                    }
                }
                
            }
        }
    }
}
// MARK: - aboutAuthor
extension AuthorView{
    @ViewBuilder
    private var aboutAuthor: some View {
        if let presentation = viewModel.authorPresentation{
            VStack{
                HStack{
                    Spacer()
                    Text("Hakkında").bold()
                    Spacer()
                }.padding(.bottom,16)
                Text(presentation.aciklama)
                HStack{
                    Text("Ünvan:").bold()
                    Text(presentation.unvanSıfat)
                    Spacer()
                }
                HStack{
                    Text("Doğum:").bold()
                    Text(presentation.dogum)
                    Spacer()
                }
                HStack{
                    Text("Ölüm:").bold()
                    Text(presentation.olum)
                    Spacer()
                }
            }
            .padding(.horizontal,24)
            .padding(.top,16)
        }
    }
}



