//
//  ChatHeaderView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 17..
//

import SwiftUI

struct ChatHeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let name: String
    let imageURL: URL?
    let videoAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.defaultBackground.edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            
            ZStack {
                HStack {
                    Spacer()
                    
                    VStack(spacing: 4) {
                        CircleImageView(url: imageURL)
                            .frame(height: 40)
                        Text(name)
                            .foregroundColor(.textPrimary)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.inactiveButton)
                        .font(.system(size: 26, weight: .semibold))
                        .frame(width: 60)
                        .offset(x: -15)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                        .padding(.leading)
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        Image(systemName: "video.fill")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.primaryPink)
                            .onTapGesture {
                                videoAction()
                            }
                        
                        Image(systemName: "shield.fill")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.primaryPink)
                            .onTapGesture {
                                videoAction()
                            }
                    }
                    .padding(.trailing)
                }
            }
        }
        .frame(height: 75)
    }
}

struct ChatHeaderView_Previews: PreviewProvider {
    static let person = Person.example1
    static var previews: some View {
        ChatHeaderView(name: person.name, imageURL: person.imageURLS[0]) {
            print("test")
        }
    }
}
