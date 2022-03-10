//
//  Extensions.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 14..
//

import SwiftUI
import LookingGlassUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func buttonColor(type: ButtonType) -> some View {
       return self.modifier(ButtonColor(type: type))
    }
}

extension Color {
    static let textPrimary = Color.black.opacity(0.75)
    static let textSecondary = Color.gray.opacity(0.8)
    
    static let inactiveButton = Color.gray.opacity(0.5)
    static let buttonGray = Color("ButtonGray")
    
    static let defaultBackground = Color("DefaultBackground")
    static let textFieldBackground = Color("TextFieldBackground")
    static let transparentBackground = Color.defaultBackground.opacity(0.5)
    
    static let primaryPink = Color("PrimaryPink")
    static let primaryOrange = Color("PrimaryOrange")
    
    static let primaryBlue = Color("PrimaryBlue")
    static let secondaryBlue = Color("SecondaryBlue")
    
    static let primaryGreen = Color("PrimaryGreen")
    static let secondaryGreen = Color("SecondaryGreen")
    
    static let primaryYellow = Color("PrimaryYellow")
    static let secondaryYellow = Color("SecondaryYellow")
    
    static let primaryPurple = Color("PrimaryPurple")
    static let secondaryPurple = Color("SecondaryPurple")
    
    static let gold = Color("Gold")
    static let goldShimmer = Color("GoldShimmer")
    
    static let messageBlue = Color("MessageBlue")
    static let messageGray = Color("MessageGray")
}
