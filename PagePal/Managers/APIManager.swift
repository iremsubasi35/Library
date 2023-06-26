//
//  APIManager.swift
//  PagePal
//
//  Created by İrem Subaşı on 23.06.2023.
//

import Foundation
import Combine

final class APIManager {
    
    func searchRequestData(with searchText: String) -> AnyPublisher<Data, Error> {
        let baseURLString = "https://z.1000kitap.com/ara?q="
        let completedURLString = "&sadece=&us=0&fr=1"
        let urlString = baseURLString + searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! + completedURLString
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .mapError { error -> Error in
                return error
            }
            .eraseToAnyPublisher()
    }
    
    // search text = seo_adi in json
    func authorRequestData(with searchText: String) -> AnyPublisher<Data, Error> {
        let baseURLString = "https://z.1000kitap.com/yazarCekV2?id="
        let completedURLString = "&bolum=genel-bakis&q=&sayfa=1&kume=-1&z=0&us=0&fr=1"
        let urlString = baseURLString + searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! + completedURLString
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .mapError { error -> Error in
                return error
            }
            .eraseToAnyPublisher()
    }
    
    // search text = kadi in json
    func bookRequestData(with searchText: String) -> AnyPublisher<Data, Error> {
        let baseURLString = "https://z.1000kitap.com/kitapCek?id="
        let completedURLString = "&bolum=genel-bakis&magazaId=&puan=&q=&sayfa=1&kume=-1&z=0&us=0&fr=1"
        let urlString = baseURLString + searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! + completedURLString
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .mapError { error -> Error in
                return error
            }
            .eraseToAnyPublisher()
    }
    
}


