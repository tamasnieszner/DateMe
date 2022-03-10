//
//  Person.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 17..
//

import SwiftUI

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLS: [URL]
    var bio: String
    var age: Int
    
    var confirmedUser: Bool = false
    var distance: Int
    
    //card manipulation
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}

extension Person {
    static let examples: [Person] = [example1, example2, example3, example4, example5]
    
    static let example1 = Person(
        name: "Mari",
        imageURLS: [URL(string: "https://picsum.photos/400/300")!,
                    URL(string: "https://picsum.photos/401/300")!,
                    URL(string: "https://picsum.photos/402/300")!],
        bio: "keresem a párom",
        age: 38,
        distance: 5
    )
    
    static let example2 = Person(
        name: "Zsanett",
        imageURLS: [URL(string: "https://picsum.photos/401/301")!,
                    URL(string: "https://picsum.photos/402/301")!,
                    URL(string: "https://picsum.photos/403/301")!,
                    URL(string: "https://picsum.photos/404/301")!],
        bio: "várlak a szökőkútnál!",
        age: 21,
        confirmedUser: true,
        distance: 1
    )
    
    static let example3 = Person(
        name: "Klárika",
        imageURLS: [URL(string: "https://picsum.photos/400/302")!,
                    URL(string: "https://picsum.photos/401/302")!],
        bio: "majd meglátjuk",
        age: 25,
        distance: 20
    )
    
    static let example4 = Person(
        name: "Teca",
        imageURLS: [URL(string: "https://picsum.photos/400/303")!,
                    URL(string: "https://picsum.photos/401/303")!],
        bio: "kérdezz...válaszolok...talán",
        age: 32,
        distance: 2
    )
    
    static let example5 = Person(
        name: "Dzsesszika",
        imageURLS: [URL(string: "https://picsum.photos/400/304")!,
                    URL(string: "https://picsum.photos/401/304")!,
                    URL(string: "https://picsum.photos/402/304")!,
                    URL(string: "https://picsum.photos/403/304")!,
                    URL(string: "https://picsum.photos/404/304")!,
                    URL(string: "https://picsum.photos/405/304")!,
                    URL(string: "https://picsum.photos/406/304")!],
        bio: "#ugyseolvasodel #rebelbitch",
        age: 20,
        distance: 4
    )
}
