//
//  PurchasePopupView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 21..
//

import SwiftUI
import LookingGlassUI

struct PurchasePopupView: View {
    @Binding var isVisible: Bool
    
    @State private var selectedIndex: Int = 1
    
    let subscriptions: [Subscription] = [
        Subscription.option1, Subscription.option2, Subscription.option3
    ]
    
    func processPayment() {
        let product = subscriptions[selectedIndex]
        print("\(product.totalCost)")
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    Text("Recurring billing, cancel anytime.")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("By tapping \"Continue\" your payment will be charged to your iTunes account, and your subscription will automatically renew for the same package length at the same price until you cancel it in settings in the iTunes store at least 24 hours prior to the end of the current period. By tapping \"Continue\", you agree to our Privacy Policy and Terms")
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.6))
                }
                .frame(height: 80)
                
                VStack {
                    Text("Get DateMe Gold®")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gold).shimmer(color: .goldShimmer)
                    
                    PurchaseSwipePromoView()
                        .frame(height: geometry.size.height/3.1)
                    
                    HStack {
                        ForEach(subscriptions.indices) { index in
                            let subscription = subscriptions[index]
                            
                            PurchaseOptionsView(subscription: subscription, isSelected: index == selectedIndex)
                                .onTapGesture {
                                    selectedIndex = index
                                }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("continue".uppercased())
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.vertical, 14)
                    .padding(.horizontal, 36)
                    .background(Color.gold.shimmer(color: .goldShimmer))
                    .cornerRadius(30)
                    .shadow(radius: 8)
                    .padding(.horizontal, 50)
                    .onTapGesture {
                        self.processPayment()
                    }
                    
                    Text("no thanks".uppercased())
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(.textSecondary)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 60)
                        .onTapGesture {
                            self.isVisible = false
                        }
                }
                .frame(width: geometry.size.width)
                .padding(.vertical, 20)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .foregroundColor(.white)
                }
            }
            .background {
                Color.black.opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct PurchasePopupView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopupView(isVisible: .constant(true))
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}
