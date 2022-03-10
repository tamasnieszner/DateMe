//
//  AppStateManager.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 14..
//

import Foundation

class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .swipe
    @Published var showPersonsProfile: Person? = nil
    @Published var showPurchasePopup: Bool = false
    @Published var showFullScreenCard: Bool = false
    
    public func showPersonsProfile(_ person: Person) {
        self.showPersonsProfile = person
    }
    
    public func showFullScreenCardView() {
        self.showFullScreenCard = true
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopup = true
    }
}
