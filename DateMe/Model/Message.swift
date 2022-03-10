//
//  Message.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 17..
//

import Foundation

struct Message: Hashable {
    var content: String
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(content: "Hellóka")
    static let exampleRecieved = Message(content: "Sziamia", person: Person.example1)
}
