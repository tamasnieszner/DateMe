//
//  LikesView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 20..
//

import SwiftUI
import LookingGlassUI

struct LikesView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    @EnvironmentObject var userManager: UserManager
    @State private var selectedTab: LikesTab = .likes
    
    enum LikesTab {
        case likes
        case topPicks
    }
    
    private var buttonText: String {
        if selectedTab == .likes {
            return "see who likes you".uppercased()
        } else {
            return "get more".uppercased()
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                //top tab view
                HStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text("\(userManager.likes.count) Likes")
                            .font(.title2)
                            .fontWeight(selectedTab == .likes ? .semibold : .medium)
                            .foregroundColor(selectedTab == .likes ? .textPrimary : .textSecondary)
                            .onTapGesture {
                                self.selectedTab = .likes
                            }
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Divider().frame(height: 30)
                    
                    HStack {
                        Spacer()
                        
                        Text("\(userManager.topPicks.count) Top Picks")
                            .font(.title2)
                            .fontWeight(selectedTab == .topPicks ? .semibold : .medium)
                            .foregroundColor(selectedTab == .topPicks ? .textPrimary : .textSecondary)
                            .onTapGesture {
                                self.selectedTab = .topPicks
                            }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.top)
                
                //selected content
                if selectedTab == .likes {
                    LikesGridView()
                } else {
                    TopPicksView()
                }
                
                Spacer()
            }
            
            //bottom button
            if !userManager.currentUser.goldSubscriber {
                HStack {
                    Spacer()
                    Text(buttonText)
                        .font(.headline)
                        .fontWeight(.heavy)
                    Spacer()
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 36)
                .foregroundColor(.white)
                .background(Color.gold).shimmer(color: .goldShimmer)
                .cornerRadius(30)
                .shadow(radius: 8)
                .padding(.horizontal, 50)
                .padding(.bottom, 30)
                .onTapGesture {
                    appStateManager.showPurchaseScreen()
                }
            }
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}
