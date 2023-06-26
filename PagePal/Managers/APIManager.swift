//
//  APIManager.swift
//  PagePal
//
//  Created by İrem Subaşı on 23.06.2023.
//

import Foundation
import Combine

final class APIManager {
    func requestData(with searchText: String) -> AnyPublisher<Data, Error> {
        let baseURLString = "https://z.1000kitap.com/ara?q="
        let completedURLString = "&sadece=&us=0&fr=1"
        let urlString = baseURLString + searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! + completedURLString
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .map { $0.data }
            .eraseToAnyPublisher()
    }
    
    
}


