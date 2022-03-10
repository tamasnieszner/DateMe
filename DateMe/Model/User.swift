//
//  User.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 19..
//

import Foundation

struct User {
    var name: String
    var age: Int
    var bio: String
    
    var imageURLS: [URL] = []
    
    var confirmedUser: Bool = false
    var goldSubscriber: Bool = false
}

extension User {
    static let example1 = User(
        name: "Lajos",
        age: 35,
        bio: "Szeretem a focit",
        imageURLS: [URL(string: "https://picsum.photos/401/301")!],
        confirmedUser: false,
        goldSubscriber: false
    )
}
