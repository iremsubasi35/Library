//
//  BookView.swift
//  PagePal
//
//  Created by Irem Subası on 17.06.2023.
//

import SwiftUI

struct BookView: View {
    @ObservedObject  private var viewModel: BookViewModel
    
    init(viewModel: BookViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            if viewModel.checkProcess {
                ProgressView()
            }else {
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
// MARK: - contentView
extension BookView{
    @ViewBuilder
    private var contentView: some View {
        VStack{
            informationOfBook
            popularityOfBook
            aboutBook
        }
    }
}

// MARK: - informationOfBook
extension BookView{
    @ViewBuilder
    private var informationOfBook: some View{
        if let presentation = viewModel.bookPresentation{
            HStack{
                AsyncImage(url: presentation.bookImage) { image in
                    image.image?
                        .resizable()
                }
                    .frame(width: 90,height: 120)
                VStack{
                    HStack{
                        Text(presentation.bookName).bold()
                        Spacer()
                    }
                    HStack{
                        AsyncImage(url: presentation.authorImage) { image in
                            image.image?
                                .resizable()
                        }
                            .frame(width: 18,height: 24)
                        Text(presentation.bookAuthor)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal,24)
                .padding(.top,16)
        }
    }
}

// MARK: - popularityOfBook
extension BookView{
    @ViewBuilder
    private var popularityOfBook: some View{
        if let presentation = viewModel.bookPresentation {
            HStack{
                VStack{
                    Text(presentation.score).bold()
                    Text(presentation.pointPerson)
                }
                VStack{
                    Text(presentation.read ).bold()
                    Text("Okunma")
                }
                VStack{
                    Text(presentation.likes).bold()
                    Text("Beğeni")
                }
                VStack{
                    Text(presentation.impression).bold()
                    Text("Gösterim")
                }
            }
            .padding(.vertical,16)
        }
    }
}
// MARK: - aboutBook
extension BookView {
    @ViewBuilder
    private var aboutBook: some View {
        if let presentation = viewModel.bookPresentation{
            VStack{
                HStack{
                    Text("Hakkında").bold()
                }.padding(.bottom,24)
                HStack{
                    Text(presentation.pageNumber)
                    Image(systemName: "clock.fill")
                               .foregroundColor(Color.black)
                    Text("Tahmini okuma süresi: 6 sa. 48 dk.")
                }.padding(.bottom,16)
                HStack{
                    Text("Adı:").bold()
                    Text(presentation.bookName)
                    Spacer()
                }.padding(.bottom,6)
                    .padding(.horizontal,16)
                HStack{
                    Text("Orijinal adı:").bold()
                    Text(presentation.originalName ?? "")
                    Spacer()
                }.padding(.horizontal,16)
                HStack{
                    Text("Yazar:").bold()
                    AsyncImage(url: presentation.authorImage) { image in
                        image.image?
                            .resizable()
                    }
                        .frame(width: 12,height: 16)
                    Text(presentation.bookAuthor)
                    Spacer()
                }.padding(.horizontal,16)
                HStack{
                    Text("Çevirmen:").bold()
                    AsyncImage(url: presentation.translatorImage) { image in
                        image.image?
                            .resizable()
                    }
                        .frame(width: 12,height: 16)
                    Text(presentation.translatorName ?? "")
                    Spacer()
                }.padding(.horizontal,16)
                HStack{
                    Text("Basım:").bold()
                    Text("")
                    Spacer()
                }.padding(.horizontal,16)
                HStack{
                    Text("Tür").bold()
                    Text(presentation.kind).background(Color.gray)
                    Spacer()
                }.padding(.horizontal,16)
                Text(presentation.explanation)
                    .padding(.horizontal,16)
            }
        }
    }
}
