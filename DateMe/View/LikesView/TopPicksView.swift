//
//  TopPicksView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 20..
//

import SwiftUI
import LookingGlassUI

struct TopPicksView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Featured profiles of the day,\npicked just for you.")
                .multilineTextAlignment(.center)
                .font(.callout)
                .foregroundColor(.textPrimary)
                .padding()
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                      alignment: .center, spacing: nil, pinnedViews: []) {
                ForEach(userManager.topPicks) { person in
                    TopPicksRectView(person: person, type: .traveller)
                        .frame(height: 256)
                        .shadow(radius: 6)
                        .onTapGesture {
                            personTapped(person)
                        }
                }
            }
                      .padding(.horizontal, 8)
        }
    }
    
    func personTapped(_ person: Person) {
        if user.goldSubscriber {
            appStateManager.showPersonsProfile(person)
        } else {
            appStateManager.showPurchaseScreen()
        }
    }
}

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}

