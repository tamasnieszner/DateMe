//
//  MainNavigationBarView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 20..
//

import SwiftUI

struct MainNavigationBarView: View {
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                
                Image("DateMe-Typo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                
                Spacer()
            }
            
            NavigationLink {
                ProfileView()
            } label: {
                CircleImageView(url: user.imageURLS.first)
                    .frame(height: 35)
            }
        }
        .padding()
    }
}

struct MainNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationBarView()
            .environmentObject(UserManager())
    }
}
