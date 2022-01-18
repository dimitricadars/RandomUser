//
//  RandomUserViewModel.swift
//  RandomUser
//
//  Created by Dimitri CADARS on 18/01/2022.
//

import Foundation

class RandomUserViewModel {
    
    let name : String
    let email : String
    let pictureLarge : String
    let pictureMedium : String
    let pictureThumbnail : String
    
    init(randomUser: RandomUser) {
        self.name = randomUser.name.title + " " + randomUser.name.last + " " + randomUser.name.first
        self.email = randomUser.email
        self.pictureLarge = randomUser.picture.large
        self.pictureMedium = randomUser.picture.medium
        self.pictureThumbnail = randomUser.picture.thumbnail
    }
}
