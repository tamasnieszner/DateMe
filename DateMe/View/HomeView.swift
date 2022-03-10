//
//  HomeView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 02. 09..
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CardStackView(people: userManager.cards)
            
            if !appStateManager.showFullScreenCard {
                HStack {
                    CircleButtonView(type: .refresh, inFullScreen: false) {
                        appStateManager.showPurchaseScreen()
                    }
                    .frame(height: 45)
                    
                    Spacer()
                    
                    CircleButtonView(type: .nope, inFullScreen: false) {
                        if let person = userManager.cards.last {
                            userManager.swipe(person, .nope)
                        }
                    }
                    
                    Spacer()
                    
                    CircleButtonView(type: .superlike, inFullScreen: false) {
                        if let person = userManager.cards.last {
                            if userManager.currentUser.goldSubscriber {
                                userManager.superLike(person)
                            } else {
                                appStateManager.showPurchaseScreen()
                            }
                        }
                    }
                    .frame(height: 45)
                    
                    Spacer()
                    
                    CircleButtonView(type: .like, inFullScreen: false) {
                        if let person = userManager.cards.last {
                            userManager.swipe(person, .like)
                        }
                    }
                    
                    Spacer()
                    
                    CircleButtonView(type: .boost, inFullScreen: false) {
                        appStateManager.showPurchaseScreen()
                    }
                    .frame(height: 45)
                }
                .frame(height: 50)
                .padding(.horizontal, 20)
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
