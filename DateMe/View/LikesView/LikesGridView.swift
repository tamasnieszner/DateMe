//
//  LikesGridView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 19..
//

import SwiftUI

struct LikesGridView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("Upgrade to Gold to see people\nwho already liked you.")
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .foregroundColor(.textPrimary)
                    .padding()
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                      alignment: .center, spacing: nil, pinnedViews: []) {
                ForEach(userManager.likes) { person in
                    PersonRectView(person: person, blurred: !user.goldSubscriber)
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

struct LikesGridView_Previews: PreviewProvider {
    static var previews: some View {
        LikesGridView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
