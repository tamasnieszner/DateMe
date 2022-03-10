//
//  PurchaseOptionsView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 24..
//

import SwiftUI
import LookingGlassUI

struct PurchaseOptionsView: View {
    var subscription: Subscription
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(subscription.month)")
                .font(.largeTitle)
            
            Spacer().frame(height: 4)
            
            Text(subscription.month == 1 ? "month" : "months")
                .if(isSelected) {
                    $0.font(.callout)
                        .fontWeight(.bold)
                }
            
            Spacer().frame(height: 2)
            
            Text("\(String(format: "%.2f", subscription.monthlyCost)) HUF/mth")
                .foregroundColor(.textSecondary)
                .font(.footnote)
                .if(isSelected) {
                    $0.fontWeight(.semibold)
                }
            
            Spacer().frame(height: 12)
            
            if subscription.savePercent != nil {
                Text("SAVE \(subscription.savePercent ?? 0)%")
                    .font(.callout)
                    .fontWeight(.heavy)
                    .foregroundColor(.gold).shimmer(color: .goldShimmer)
                    .frame(height: 22)
            } else {
                Spacer().frame(height: 22)
            }
            
            Spacer().frame(height: 14)
            
            Text("\(String(format: "%.2f", subscription.totalCost)) HUF")
                .font(.body)
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 2)
        .padding(.vertical)
        //non-selected UI
        .if(!isSelected) {
            $0.foregroundColor(.textSecondary)
        }
        .if(!isSelected && subscription.tagLine != .none) {
            $0.overlay {
                VStack {
                    Text(subscription.tagLine.rawValue)
                        .font(.caption)
                        .foregroundColor(.textSecondary)
                        .padding(.top, 2)
                        .minimumScaleFactor(0.1)
                    
                    Spacer()
                }
            }
        }
        //selected UI
        .if(isSelected && subscription.tagLine == .none) {
            $0.overlay {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Color.gold, lineWidth: 2)
            }
        }
        .if(isSelected && subscription.tagLine != .none) {
            $0.overlay {
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.gold).shimmer(color: .goldShimmer)
                        .frame(height: 20)
                        .cornerRadius(12, corners: [.topLeft, .topRight]) //custom corner radius
                    
                    Text(subscription.tagLine.rawValue)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.top, 2)
                        .minimumScaleFactor(0.1)
                    
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Color.gold, lineWidth: 2)
                }
            }
        }
    }
}

struct PurchaseOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            PurchaseOptionsView(subscription: Subscription.option1, isSelected: false)
                .motionManager(updateInterval: 0.1, disabled: false)
            
            PurchaseOptionsView(subscription: Subscription.option2, isSelected: false)
                .motionManager(updateInterval: 0.1, disabled: false)
            
            PurchaseOptionsView(subscription: Subscription.option3, isSelected: true)
                .motionManager(updateInterval: 0.1, disabled: false)
        }
    }
}
