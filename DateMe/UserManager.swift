//
//  UserManager.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 19..
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 0, bio: "")
    @Published var likes: [Person] = []
    @Published var topPicks: [Person] = []
    @Published var cards: [Person] = []
    
    init() {
        fetchUser()
    }
    
    private func fetchUser() {
        //networking
        self.currentUser = User.example1
        
        fetchCards()
        fetchLikes()
        fetchTopPicks()
    }
    
    private func fetchCards() {
        //networking
        self.cards = [Person.example1, Person.example2, Person.example3, Person.example4, Person.example5]
    }
    
    private func fetchLikes(/*user: User */) {
        //networking
        self.likes = [Person.example1, Person.example2, Person.example3, Person.example4, Person.example5]
    }
    
    private func fetchTopPicks(/*user: User */) {
        //networking
        self.topPicks = [Person.example2, Person.example4]
    }
    
    enum SwipeDirection {
        case like
        case nope
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        //networking
        cards.removeLast()
    }
    
    public func superLike(_ person: Person) {
        //networking
        cards.removeLast()
    }
}
