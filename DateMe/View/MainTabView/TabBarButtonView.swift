//
//  TabBarButtonView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 14..
//

import SwiftUI


enum TabBarButtonType: String {
    case swipe = "flame.fill"
    case explore = "person.crop.rectangle.stack.fill"
    case likes = "sparkle"
    case message = "bubble.left.and.bubble.right.fill"
}

struct TabBarButtonView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    var type: TabBarButtonType
    
    func gradientForeground() -> LinearGradient {
        switch type {
        case .swipe, .explore, .message:
            return primaryGradient
        case .likes:
            return goldGradient
        }
    }
    
    var body: some View {
        Image(systemName: type.rawValue)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .if(appStateManager.selectedTab == type) {
                $0.foregroundStyle(gradientForeground())
            }
            .foregroundColor(.buttonGray)
            .frame(width: 28, height: 28)
            .onTapGesture {
                appStateManager.selectedTab = type
            }
    }
}

struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(type: .swipe)
            .environmentObject(AppStateManager())
            .previewLayout(.sizeThatFits).padding()
    }
}
