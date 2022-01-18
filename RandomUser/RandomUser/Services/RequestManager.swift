//
//  RequestManager.swift
//  RandomUser
//
//  Created by Dimitri CADARS on 18/01/2022.
//

import Foundation

enum NetworkError: Error {
    case UrlError
    case ServerError(description: String)
    case StatusCodeError(code: Int)
    case DataNotFoundError
    case ParseError(description: String)
    var description: String {
        switch self {
        case .UrlError:
            return "Invalid URL."
        case .ServerError(let desc):
            return "Server responded with the error \(desc)."
        case .DataNotFoundError:
            return "Data not found."
        case .ParseError(let desc):
            return "Parsing Error. \(desc)"
        case .StatusCodeError(let code):
            return "Error with status code \(code)"
        }
    }
}

class RequestManager {
    static func fetchData<T: Decodable>(url: String, completion: @escaping (Result<T, NetworkError>) -> ()) {
        guard let url = URL(string: url) else {
            return completion(.failure(.UrlError))
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(.ServerError(description: error.localizedDescription)))
            }
            
            if let httpresponse = response as? HTTPURLResponse, httpresponse.statusCode != 200 {
                completion(.failure(.StatusCodeError(code: httpresponse.statusCode)))
            }
            
            guard let dataResponse = data else {
                return completion(.failure(.DataNotFoundError))
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: dataResponse)
                completion(.success(decodedData))
            }
            catch let err {
                completion(.failure(.ParseError(description: err.localizedDescription)))
            }
        }.resume()
    }
    

}

