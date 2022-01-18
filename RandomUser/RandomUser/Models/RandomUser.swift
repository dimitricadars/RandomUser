//
//  RandomUser.swift
//  RandomUser
//
//  Created by Dimitri CADARS on 18/01/2022.
//

import Foundation

struct RandomUserResponse : Decodable {
    var results : [RandomUser]
}

struct RandomUser : Decodable {
    var name : Name
    var email : String
    var picture : Picture
}

struct Name : Decodable {
    var title : String
    var first : String
    var last : String
}

struct Picture : Decodable {
    var large : String
    var medium : String
    var thumbnail : String
}
