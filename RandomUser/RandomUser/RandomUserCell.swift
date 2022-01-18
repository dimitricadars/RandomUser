//
//  RandomUserCell.swift
//  RandomUser
//
//  Created by Dimitri CADARS on 18/01/2022.
//

import Foundation
import UIKit
import SDWebImage

class RandomUserCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    func configure(vm: RandomUserViewModel) {
        self.name.text = vm.name
        self.email.text = vm.email
        self.userImageView.sd_setImage(with: URL(string: vm.pictureLarge), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
}
