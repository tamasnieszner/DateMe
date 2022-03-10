//
//  ProfileSwipePromoView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 17..
//

import SwiftUI
import LookingGlassUI

struct ProfileSwipePromoView: View {
    @State var pageIndex = 0
    
    var action: () -> Void
    
    func profileButtonText() -> String {
        if pageIndex == 0 {
            return "get dateme gold®"
        } else {
            return "see all plans"
        }
    }
    
    var body: some View {
        ZStack {
            Color.init(uiColor: .lightGray).opacity(0.3)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack(spacing: 0) {
                Spacer()
                //page tab view
                TabView(selection: $pageIndex) {
                    //page1
                    VStack(spacing: 8) {
                        Spacer()
                        HStack {
                            Image(systemName: "flame.fill")
                                .font(.title2)
                                .foregroundColor(.gold).shimmer(color: .goldShimmer)
                            Text("Get DateMe Gold®")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        Text("See who Likes You & more!")
                            .font(.footnote)
                    }
                    .tag(0)
                    .padding()
                    .padding(.bottom, 60)
                    
                    //page2
                    VStack(spacing: 8) {
                        Spacer()
                        
                        HStack {
                            Image(systemName: "flame.fill")
                                .font(.title2)
                                .foregroundColor(.primaryPink)
                            Text("Stand out with Super Like")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        Text("You're 3 times more likely to get a match!")
                            .font(.footnote)
                    }
                    .tag(1)
                    .padding()
                    .padding(.bottom, 60)
                    
                    //page3
                    VStack(spacing: 8) {
                        Spacer()
                        HStack {
                            Image(systemName: "flame.fill")
                                .font(.title2)
                                .foregroundColor(.primaryPink)
                            Text("Skip the queue")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        Text("Be a top profile in your area to get more matches.")
                            .font(.footnote)
                    }
                    .tag(2)
                    .padding()
                    .padding(.bottom, 60)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                //bottom button
                HStack {
                    Spacer()
                    Text(profileButtonText().uppercased())
                        .font(.headline)
                        .fontWeight(.heavy)
                    Spacer()
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 36)
                .foregroundColor(pageIndex == 0 ? .gold : .primaryPink)
                .background(.white)
                .cornerRadius(30)
                .shadow(radius: 8)
                .padding(.horizontal, 50)
                .padding(.bottom, 30)
                .onTapGesture {
                    self.action()
                }
            }
        }
    }
}

struct ProfileSwipePromoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSwipePromoView {
            print("testing")
        }
        .motionManager(updateInterval: 0.1, disabled: false)
    }
}
