//
//  BooksApiService.swift
//  test2
//
//  Created by Oleg Makarov on 21.11.2021.
//

import Foundation

enum BooksApiEndopints: String{
    case books = "books"
    
}

class BookApiService {
    let baseApiUrl = "https://demo.api-platform.com/"
    let decoder = JSONDecoder()
    
    func loadBooks(page: Int, booksCallback:  @escaping (BooksResponse?, Error?) -> Void){
        let endPoint = URL(string: "\(baseApiUrl)\(BooksApiEndopints.books)??page=\(page)")
        
        print("End Point \(String(describing: endPoint))")
        let request = URLRequest(url: endPoint!)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let unwrapedData = data,
               let booksResponse = try? self.decoder.decode(BooksResponse.self, from: unwrapedData){
                booksCallback(booksResponse,nil)
            } else if  let unwrapedError = error {
                print(unwrapedError)
            } else {
                
            }
        }
        dataTask.resume()
    }
}
