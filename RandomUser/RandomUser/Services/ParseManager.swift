//
//  ParseManager.swift
//  RandomUser
//
//  Created by Dimitri CADARS on 18/01/2022.
//

import Foundation

class ParseManager {
    
    static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    static func parse<T: Decodable>(jsonData: Data,completion: @escaping (Result<T, NetworkError>) -> ()) {
        do {
            let decodedData = try JSONDecoder().decode(T.self,
                                                       from: jsonData)
            
            completion(.success(decodedData))
        } catch let err {
            completion(.failure(.ParseError(description: err.localizedDescription)))
        }
    }
    
}
