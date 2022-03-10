//
//  Modifiers.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 18..
//

import SwiftUI

struct HideNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}

struct ButtonColor: ViewModifier {
    var type: ButtonType
    
    func body(content: Content) -> some View {
        switch type {
        case .refresh:
            return content.foregroundStyle(yellowGradient)
        case .nope:
            return content.foregroundStyle(primaryGradient)
        case .superlike:
            return content.foregroundStyle(blueGradient)
        case .like:
            return content.foregroundStyle(greenGradient)
        case .boost:
            return content.foregroundStyle(purpleGradient)
        }
    }
}
