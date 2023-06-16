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
        ScrollView{
            contentView
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
        HStack{
            Image("totemTabu").resizable()
                .frame(width: 90,height: 120)
            VStack{
                HStack{
                    Text("Totem ve Tabu").bold()
                    Spacer()
                }
                HStack{
                    Image("SigmundFreud").resizable()
                        .frame(width: 18,height: 24)
                    Text("Sigmund Freud")
                    Spacer()
                }
            }
        }
        .padding(.horizontal,24)
            .padding(.top,16)
    }
}

// MARK: - popularityOfBook
extension BookView{
    @ViewBuilder
    private var popularityOfBook: some View{
        HStack{
            VStack{
                Text("8.2/10").bold()
                Text("983 Kişi")
            }
            VStack{
                Text("4.950").bold()
                Text("Okunma")
            }
            VStack{
                Text("1.004").bold()
                Text("Beğeni")
            }
            VStack{
                Text("71.400").bold()
                Text("Gösterim")
            }
        }
        .padding(.vertical,16)
    }
}
// MARK: - aboutBook
extension BookView {
    @ViewBuilder
    private var aboutBook: some View {
        VStack{
            HStack{
                Text("Hakkında").bold()
            }.padding(.bottom,24)
            HStack{
                Text("240 sayfa")
                Image(systemName: "clock.fill")
                           .foregroundColor(Color.black)
                Text("Tahmini okuma süresi: 6 sa. 48 dk.")
            }.padding(.bottom,16)
            HStack{
                Text("Adı:").bold()
                Text("Totem ve Tabu")
                Spacer()
            }.padding(.bottom,6)
                .padding(.horizontal,16)
            HStack{
                Text("Orijinal adı:").bold()
                Text("Totem und Tabu")
                Spacer()
            }.padding(.horizontal,16)
            HStack{
                Text("Yazar:").bold()
                Image("SigmundFreud").resizable()
                    .frame(width: 12,height: 16)
                Text("Sigmund Freud")
                Spacer()
            }.padding(.horizontal,16)
            HStack{
                Text("Çevirmen:").bold()
                Image("SigmundFreud").resizable()
                    .frame(width: 12,height: 16)
                Text("Kamuran Şipal")
                Spacer()
            }.padding(.horizontal,16)
        }
    }
}