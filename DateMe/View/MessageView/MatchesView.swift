//
//  MatchesView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 21..
//

import SwiftUI
import LookingGlassUI

struct MatchesView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                MessageLikesView()
                    .frame(width: 90, height: 100)
                    .padding(10)
                    .overlay {
                        Text("\(userManager.likes.count)")
                            .font(.title3)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.gold.shimmer(color: Color.goldShimmer))
                            .clipShape(Circle())
                    }
                
                Text("Likes")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.textPrimary)
            }
        }
        .padding(10)
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}
