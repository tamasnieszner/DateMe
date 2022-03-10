//
//  Subscription.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 24..
//

import Foundation

struct Subscription: Identifiable {
    let id = UUID()
    
    var month: Int
    var monthlyCost: Double
    var totalCost: Double
    var savePercent: Int?
    var tagLine: TagLine = .none
    
    enum TagLine: String {
        case mostPopular = "MOST POPULAR"
        case bestValue = "BEST VALUE"
        case none
    }
}

extension Subscription {
    static let option1 = Subscription(
        month: 12,
        monthlyCost: 3832.50,
        totalCost: 45990.00,
        savePercent: 67,
        tagLine: .bestValue
    )
    
    static let option2 = Subscription(
        month: 6,
        monthlyCost: 5831.67,
        totalCost: 34990.00,
        savePercent: 49,
        tagLine: .mostPopular
    )
    
    static let option3 = Subscription(
        month: 1,
        monthlyCost: 11490.00,
        totalCost: 11490.00
    )
}
