//
//  RandomUserListTableViewController.swift
//  RandomUser
//
//  Created by Dimitri CADARS on 18/01/2022.
//

import Foundation
import UIKit

class RandomUserListTableViewController : UITableViewController {
    
    var randomUserListViewModel = RandomUserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandonUser()
    }
    
    func getRandonUser() {
        
        let loader = self.loader()
        
        randomUserListViewModel.getRandomUsers {[weak self] result in
            
            switch result {
                
            case .success(let arrayOfRandomUserViewModel):
                self?.randomUserListViewModel.randomUserViewModels = arrayOfRandomUserViewModel
                self?.tableView.reloadData()
                self?.stopLoader(loader: loader)
                
            case .failure:
                self?.stopLoader(loader: loader)
                self?.displayAlert(message: "Désolé, quelque chose s'est mal passé dans la récupération des données. Veuillez réessayer plus tard",title: "Error")
            }
        }
    }
}

extension RandomUserListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUserListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath) as! RandomUserCell
        cell.configure(vm: self.randomUserListViewModel.randomUserViewModels[indexPath.row])
        return cell
    }
    
}




