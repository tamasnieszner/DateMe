//
//  ProfilePremiumView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 21..
//

import SwiftUI

struct ProfileGoldView: View {
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.init(uiColor: .lightGray).opacity(0.3)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.messageBlue)
                            .font(.system(size: 30))
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        HStack {
                            Text("5")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.messageBlue)
                            Text("Super Likes")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.buttonGray)
                        }
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.primaryPurple)
                            .font(.system(size: 30, weight: .bold))
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        HStack {
                            Text("1")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.primaryPurple)
                            Text("Boost")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.buttonGray)
                        }
                    }
                    .frame(width: 120)
                    
                    Spacer()
                }
                
                Spacer()
                
                //bottom button
                HStack {
                    Spacer()
                    Text("my dateme gold®".uppercased())
                        .font(.headline)
                        .fontWeight(.heavy)
                    Spacer()
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 36)
                .foregroundColor(.primaryPink)
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

struct ProfilePremiumView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileGoldView {
            print("test")
        }
    }
}
