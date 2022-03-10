//
//  PurchasePromoView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 24..
//

import SwiftUI
import LookingGlassUI

struct PurchasePromoView: View {
    var imageName: String
    var headline: String
    var description: String
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
            
            Text(headline)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.textPrimary)
            
            Text(description)
                .font(.body)
                .foregroundColor(.textPrimary)
        }
    }
}

struct PurchasePromoView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePromoView(imageName: "heart.fill", headline: "5 people already like you!", description: "Match with them instantly")
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}
