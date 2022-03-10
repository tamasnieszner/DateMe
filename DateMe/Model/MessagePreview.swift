//
//  MessagePreview.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 17..
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example1 = MessagePreview(person: Person.example1, lastMessage: "Mizu? mit csinálsz éppen? hogy telik a nap?")
    static let example2 = MessagePreview(person: Person.example2, lastMessage: "Szióka! Teccesz!!")
}
