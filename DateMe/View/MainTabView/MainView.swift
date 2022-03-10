//
//  MainView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 14..
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    func viewForState() -> some View {
        switch appStateManager.selectedTab {
        case .swipe:
            let view = HomeView()
            return AnyView(view)
        case .explore:
            let view = Text("soon")
            return AnyView(view)
        case .likes:
            let view = LikesView()
            return AnyView(view)
        case .message:
            let view = MessageListView()
            return AnyView(view)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.defaultBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    //top navigation bar
                    MainNavigationBarView()
                        .padding(.top, 35)
                    
                    Spacer()
                    
                    //page content
                    viewForState()
                    
                    Spacer()
                    
                    //bottom tab bar
                    HStack {
                        Spacer()
                        TabBarButtonView(type: .swipe)
                        Spacer()
                        TabBarButtonView(type: .explore)
                        Spacer()
                        TabBarButtonView(type: .likes)
                        //likes count
                            .if(userManager.likes.count > 0) {
                                $0.overlay {
                                    Text("\(userManager.likes.count)")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(4)
                                        .background(Color.gold)
                                        .clipShape(Circle())
                                        .offset(x: 15, y: -15)
                                }
                            }
                        
                        Spacer()
                        TabBarButtonView(type: .message)
                        Spacer()
                    }
                    .padding(.bottom)
                }
                .edgesIgnoringSafeArea(.top)
                
                //popup
                if appStateManager.showPurchasePopup {
                    PurchasePopupView(isVisible: $appStateManager.showPurchasePopup)
                        .transition(.offset(y: -800))
                }
            }
            .modifier(HideNavigationBar())
            
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.6), value: appStateManager.showPurchasePopup) //popup animation
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
