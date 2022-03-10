//
//  FullScreenCardView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 02. 01..
//

import SwiftUI

struct FullScreenCardView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    @Binding var fullscreenMode: Bool
    
    var person: Person
    let screen = UIScreen.main.bounds
    var namespace: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    //profile cardview
                    CardImageScrollerView(fullscreenMode: $fullscreenMode, person: person)
                        .frame(width: screen.width, height: screen.height*0.65)
                        .matchedGeometryEffect(id: "image-\(person.id)", in: namespace)
                    
                    //profile
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(person.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text(String(person.age))
                                    .font(.title2)
                                    .fontWeight(.light)
                                
                                if person.confirmedUser {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(.messageBlue)
                                }
                                
                                Spacer()
                            }
                            .foregroundColor(.textPrimary)
                            
                            HStack {
                                Image(systemName: "person")
                                
                                Text("Woman")
                            }
                            .font(.headline)
                            .foregroundColor(.textPrimary)
                            
                            HStack {
                                Image(systemName: "mappin")
                                
                                if person.distance == 1 {
                                    Text("\(person.distance) kilometre away")
                                } else {
                                    Text("\(person.distance) kilometres away")
                                }
                            }
                            .font(.headline)
                            .foregroundColor(.textPrimary)
                        }
                        .padding([.horizontal, .top], 16)
                        
                        //fullscreen bezáró gomb
                        Image(systemName: "arrow.down.circle.fill")
                            .font(.system(size: 42))
                            .foregroundColor(.primaryPink)
                            .background {
                                Color.white
                                    .clipShape(Circle())
                            }
                            .offset(y: -45)
                            .padding(.trailing, 16)
                            .onTapGesture {
                                fullscreenMode = false
                            }
                    }
                    
                    Divider()
                        .padding(.top, 16)
                    
                    Spacer().frame(height: 16)
                    
                    HStack {
                        Text(person.bio)
                            .foregroundColor(.textPrimary)
                            .font(.body)
                            .fontWeight(.medium)
                            .lineLimit(20)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    }
                    
                    Divider()
                        .padding(.top, 18)
                    
                    Spacer().frame(height: 12)
                    
                    //alsó gombok a megosztáshoz/jelentéshez
                    VStack(spacing: 24) {
                        VStack(spacing: 6) {
                            Text("share \(person.name)'s profile".uppercased())
                                .font(.headline)
                            Text("see what a friend thinks".uppercased())
                                .font(.subheadline)
                        }
                        .foregroundColor(.textPrimary)
                        .onTapGesture {
                            self.showActionSheet()
                        }
                        
                        Divider()
                        
                        Text("report \(person.name)".uppercased())
                            .font(.headline)
                            .foregroundColor(.textPrimary)
                            .onTapGesture {
                                //
                            }
                    }
                    
                    Divider()
                        .padding(.top, 24)
                    
                    Spacer().frame(height: 200)
                }
            }
            
            //fő (like/nope) gombok
            HStack(spacing: 25) {
                Spacer()
                
                CircleButtonView(type: .nope, inFullScreen: true) {
                    appStateManager.showFullScreenCard = false
                    userManager.swipe(person, .nope)
                }
                .frame(height: 50)
                
                CircleButtonView(type: .superlike, inFullScreen: true) {
                    appStateManager.showFullScreenCard = false
                    userManager.superLike(person)
                }
                .frame(height: 45)
                
                CircleButtonView(type: .like, inFullScreen: true) {
                    appStateManager.showFullScreenCard = false
                    userManager.swipe(person, .like)
                }
                .frame(height: 50)
                
                Spacer()
            }
            .padding(.top, 25)
            .padding(.bottom, 40)
            .edgesIgnoringSafeArea(.bottom)
            .background {
                LinearGradient(
                    colors: [Color.white.opacity(0.2), Color.white],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func showActionSheet() {
        let items: [Any] = ["What do you think about \(person.name)?"]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
    }
}

struct FullscreenCardView_Previews: PreviewProvider {
    @Namespace static var placeholder
    static var previews: some View {
        FullScreenCardView(fullscreenMode: .constant(true), person: Person.example2, namespace: placeholder)
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
