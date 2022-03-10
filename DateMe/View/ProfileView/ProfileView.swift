//
//  ProfileView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 14..
//

import SwiftUI
import LookingGlassUI

struct ProfileView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    @Environment(\.presentationMode) var presentationMode
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    ZStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            
                            Text("Profile")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.inactiveButton)
                            .font(.system(size: 26, weight: .semibold))
                            .padding(.leading)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                    }
                    
                    Spacer()
                    
                    VStack {
                        //profile picture
                        CircleImageView(url: user.imageURLS.first)
                            .frame(height: 170)
                        
                        Spacer().frame(height: 10)
                        
                        //labels
                        Group {
                            HStack {
                                Text("\(user.name), \(user.age)")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.textPrimary)
                                
                                if user.confirmedUser {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(.messageBlue)
                                } else {
                                    Image(systemName: "checkmark.seal")
                                        .foregroundColor(.inactiveButton)
                                }
                            }
                            
                            Spacer().frame(height: 30)
                        }
                        
                        //center buttons
                        HStack {
                            Spacer()
                            
                            ProfileButtonView(title: "settings", imageName: "gearshape.fill") {
                                //
                            }
                            .frame(width: 80)
                            
                            Spacer()
                            
                            ProfileButtonView(title: "edit", imageName: "pencil") {
                                //
                            }
                            .frame(width: 80)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                        
                        Spacer().frame(height: 30)
                    }
                    
                    Spacer()
                    
                    //footer
                    if !user.goldSubscriber {
                        ProfileSwipePromoView {
                            appStateManager.showPurchaseScreen()
                        }
                        .frame(height: geometry.size.height/3)
                    } else {
                        ProfileGoldView {
                            //
                        }
                        .frame(height: geometry.size.height/3)
                    }
                }
                .modifier(HideNavigationBar())
                .foregroundColor(.textPrimary)
                
                //popup
                if appStateManager.showPurchasePopup {
                    PurchasePopupView(isVisible: $appStateManager.showPurchasePopup)
                        .transition(.offset(y: -800))
                }
            }
            .animation(.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.6), value: appStateManager.showPurchasePopup) //popup animation
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
            .motionManager(updateInterval: 0.1, disabled: false)
            .background(Color.defaultBackground)
    }
}
