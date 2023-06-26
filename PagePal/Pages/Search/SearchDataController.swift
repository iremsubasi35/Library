//
//  SearchDataController.swift
//  PagePal
//
//  Created by Irem Subası on 16.06.2023.
//

import Foundation
import Combine

final class SearchDataController: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
   
    
    func fetchData(with searchText: String) {
        let apiManager = APIManager()

        apiManager.requestData(with: searchText)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // API hatası oluştu, hata işleme
                    print("API Hatası: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] data in
                // Verileri parse etme ve ViewModel'e aktarma
                do {
                    let searchData = try JSONDecoder().decode(SearchResponse.self, from: data)
                    self?.parseData(searchData)
                } catch {
                    print("JSON decode hatası: \(error.localizedDescription)")
                }
            }
            .store(in: &cancellables)
    }
    func fetchDataa(with searchText: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let baseURLString = "https://z.1000kitap.com/ara?q="
        let completedURLString = "&sadece=&us=0&fr=1"
        let urlString = baseURLString + searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! + completedURLString

        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                let error = NSError(domain: "Data Error", code: 0, userInfo: nil)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    

    
    private func parseData(_ searchData: SearchResponse) {
        // Verileri işleme ve ViewModel'e aktarma işlemleri burada yapılır
        for result in searchData.sonuclar {
            print("Name: \(result.name ?? "")")
            print("Turu: \(result.turu ?? "")")
            if let content = result.icerik {
                print("Resim: \(content.resim ?? "")")
            }
            print("-------------")
        }
    }
}

