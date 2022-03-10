//
//  PurchaseSwipePromoView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 21..
//

import SwiftUI
import LookingGlassUI

struct PurchaseSwipePromoView: View {
    var body: some View {
        TabView {
            PurchasePromoView(
                imageName: "heart.fill",
                headline: "5 people already like you!",
                description: "Match with them instantly"
            )
                .foregroundColor(.gold).shimmer(color: .goldShimmer)
            
            PurchasePromoView(
                imageName: "heart.circle",
                headline: "Unlimited likes",
                description: "Swipe right as much as you want."
            )
                .foregroundColor(.green)
            
            PurchasePromoView(
                imageName: "bolt.circle",
                headline: "1 free Boost every 1 month",
                description: "Skip the queue to get more matches!"
            )
                .foregroundColor(.primaryPurple)
            
            PurchasePromoView(
                imageName: "star.circle",
                headline: "5 free Super Likes every 1 week",
                description: "You're 3 times more likely to get a match!"
            )
                .foregroundColor(.messageBlue)
            
            PurchasePromoView(
                imageName: "arrow.counterclockwise.circle",
                headline: "Unlimited Rewinds",
                description: "Go back and swipe again!"
            )
                .foregroundColor(.yellow)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct PurchaseSwipePromoView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseSwipePromoView()
            .motionManager(updateInterval: 0.1, disabled: false)
            .frame(height: UIScreen.main.bounds.height/3)
    }
}
