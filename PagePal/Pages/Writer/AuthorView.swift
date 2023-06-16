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
        ScrollView{
            contentView
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
        HStack{
            Image("CanYucel").resizable()
                .frame(width: 90,height: 120) //fix
            VStack{
                HStack{
                    Text("Can Yücel").bold()
                    Spacer()
                }
                HStack{
                    Text("Yazar")
                        .background(Color.red)
                        .foregroundColor(Color.white)
                    Text("Çevirmen")
                        .background(Color.red)
                        .foregroundColor(Color.white)
                    Spacer()
                }
            }
        }.padding(.horizontal,24)
            .padding(.top,16)
    }
}
// MARK: - popularityOfAuthor
extension AuthorView{
    @ViewBuilder
    private var popularityOfAuthor: some View {
        HStack{
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(Color.black)
                VStack{
                    Text("7.6").bold()
                    Text("3.172 Kişi")
                        .font(.system(size: 12))
                }
            }
            Text("|")
            HStack{
                Image(systemName: "book.fill")
                    .foregroundColor(Color.black)
                VStack{
                    Text("13,4 ").bold()
                    Text("okunma")
                        .font(.system(size: 12))
                }
            }
            Text("|")
            HStack{
                Image(systemName: "heart.fill")
                    .foregroundColor(Color.black)
                VStack{
                    Text("3.769").bold()
                    Text("beğenme")
                        .font(.system(size: 12))
                }
            }
            Text("|")
            HStack{
                Image(systemName: "heart.fill")
                    .foregroundColor(Color.black)
                VStack{
                    Text("65,9 ").bold()
                    Text("gösterim")
                        .font(.system(size: 12))
                }
            }
            
        }
    }
}
// MARK: - aboutAuthor
extension AuthorView{
    @ViewBuilder
    private var aboutAuthor: some View {
        VStack{
            HStack{
                Spacer()
                Text("Hakkında").bold()
                Spacer()
            }.padding(.bottom,16)
            Text("Kullandığı kaba ama samimi dil ile Türk şiirinde farklı bir tarz yaratmıştır. Can Yücel, 1926'da İstanbul'da doğdu. Millî Eğitim Eski Bakanı Hasan Ali Yücel’in oğludur.Ankara ve Cambridge üniversitelerinde Latince ve Yunanca okudu. Çeşitli elçiliklerde çevirmenlik, Londra’da BBC’nin Türkçe bölümünde spikerlik yaptı. Askerliğini Kore’de yaptı. 1958’de Türkiye’ye döndükten sonra bir süre Bodrum ve Marmaris'te turist rehberi olarak çalıştı. Ardından bağımsız çevirmen ve şair olarak yaşamını İstanbul’da sürdürdü.")
            HStack{
                Text("Ünvan:").bold()
                Text("Türk şair")
                Spacer()
            }
            HStack{
                Text("Doğum:").bold()
                Text("İstanbul, Türkiye, 21 Ağustos 1926 ")
                Spacer()
            }
            HStack{
                Text("Ölüm:").bold()
                Text("Datça, Muğla, Türkiye, 12 Ağustos 1999 ")
                Spacer()
            }
        }
        .padding(.horizontal,24)
        .padding(.top,16)
    }
}
