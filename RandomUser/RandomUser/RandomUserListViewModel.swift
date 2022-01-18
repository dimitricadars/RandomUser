//
//  RandomUserListViewModel.swift
//  RandomUser
//
//  Created by Dimitri CADARS on 18/01/2022.
//

import Foundation

class RandomUserListViewModel {
    
    var randomUserViewModels = [RandomUserViewModel]()
    
    func numberOfRows(_ section: Int) -> Int {
        return randomUserViewModels.count
    }
    
    func getRandomUsers(completion: @escaping (Result<[RandomUserViewModel],Error>) -> Void) {
        
        let url = Constants.Urls.urlForRandomUsers()
        
        RequestManager.fetchData(url: url) {
            
            (response: Result<RandomUserResponse?,NetworkError>) in
            
            DispatchQueue.main.async {
                
                switch response {
                    
                case .success(let data):
                    
                    if let results = data?.results {
                        let arrayOfRandomUserViewModel = results.map{RandomUserViewModel(randomUser: $0)}
                        completion(.success(arrayOfRandomUserViewModel))
                    }
               
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
