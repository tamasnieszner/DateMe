//
//  CardImageScrollerView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 27..
//

import SwiftUI
import Kingfisher

struct CardImageScrollerView: View {
    @EnvironmentObject var appStateManager: AppStateManager
    @State var imageIndex = 0
    
    @Binding var fullscreenMode: Bool
    
    var screenWidthCutoff = (UIScreen.main.bounds.width/2)*0.2
    var screenHeightCutoff = (UIScreen.main.bounds.height/2)*0.2
    var person: Person
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex+1
        } else {
            newIndex = imageIndex-1
        }
        
        imageIndex = min(max(0, newIndex), person.imageURLS.count-1)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack(alignment: .bottom) {
                    KFImage(person.imageURLS[imageIndex])
                        .placeholder {
                            Color.textSecondary
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    
                    if !fullscreenMode {
                        LinearGradient(
                                colors: [Color.black.opacity(0.01), Color.black],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        .frame(height: geometry.size.height/2)
                    }
                    
                    ZStack {
                        Image("superLike")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .opacity(Double(person.y/screenWidthCutoff * -1) - 1)
                            .padding(.top, 100)
                        
                        VStack {
                            HStack {
                                Image("like")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150)
                                    .opacity(Double(person.x/screenWidthCutoff) - 1)
                                
                                Spacer()
                                
                                Image("nope")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150)
                                    .opacity(Double(person.x/screenWidthCutoff * -1) - 1)
                            }
                            
                            Spacer()
                        }
                        .padding()
                    }
                    
                    HStack {
                        Rectangle()
                            .onTapGesture {
                                self.updateImageIndex(addition: false)
                            }
                        
                        Rectangle()
                            .onTapGesture {
                                self.updateImageIndex(addition: true)
                            }
                    }
                    .foregroundColor(Color.white.opacity(0.01))
                }
                
                VStack {
                    HStack {
                        ForEach(0..<person.imageURLS.count) { index in
                            RoundedRectangle(cornerRadius: 12)
                                .frame(height: 4)
                                .if(self.imageIndex == index) {
                                    $0.overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.textPrimary, lineWidth: 1)
                                    }
                                }
                                .foregroundColor(self.imageIndex == index ? .white : .gray.opacity(0.5))
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, 12)
                    
                    Spacer()
                    
                    if !fullscreenMode {
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(person.name)
                                            .font(.title)
                                            .fontWeight(.bold)
                                        
                                        Text(String(person.age))
                                            .font(.title2)
                                            .fontWeight(.light)
                                    }
                                    
                                    Text(person.bio)
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .lineLimit(2)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .medium))
                                    .onTapGesture {
                                        fullscreenMode = true
                                    }
                            }
                            .padding(.horizontal, 16)
                        }
                        .padding(.bottom, 80)
                    }
                }
                .foregroundColor(.white)
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

struct CardImageScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScrollerView(fullscreenMode: .constant(true), person: Person.example2)
            .environmentObject(AppStateManager())
    }
}
