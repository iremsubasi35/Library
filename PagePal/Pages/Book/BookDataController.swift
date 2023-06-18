//
//  BookDataController.swift
//  PagePal
//
//  Created by Irem Subası on 17.06.2023.
//

import Foundation

final class BookDataController: ObservableObject{
    
    func fetchData(bookId: String, completion: @escaping (Result<Data, Error>) -> Void) {
            let baseURLString = "https://z.1000kitap.com/kitapCek?id="
            let completedURLString = "&bolum=genel-bakis&magazaId=&puan=&q=&sayfa=1&kume=-1&z=0&us=0&fr=1"
            let urlString = baseURLString + bookId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! + completedURLString
            
            guard let url = URL(string: urlString) else {
                let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    let error = NSError(domain: "No Data", code: 0, userInfo: nil)
                    completion(.failure(error))
                    return
                }
                
                completion(.success(data))
            }
            
            task.resume()
        }
}
