//
//  CardView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 02. 01..
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var userManager: UserManager
    @Binding var fullscreenMode: Bool
    @State var person: Person
    @Namespace var imageNamespace
    
    let screenCutoff = (UIScreen.main.bounds.width/2)*0.5
    
    var body: some View {
        GeometryReader { geometry in
            if fullscreenMode {
                FullScreenCardView(fullscreenMode: $fullscreenMode, person: person, namespace: imageNamespace)
                    .animation(.easeOut(duration: 0.2))
            } else {
                CardImageScrollerView(fullscreenMode: $fullscreenMode, person: person)
                        .frame(width: geometry.size.width-20, height: geometry.size.height)
                        .padding(.leading, 10)
                        .matchedGeometryEffect(id: "image-\(person.id)", in: imageNamespace)
                        .offset(x: person.x, y: person.y)
                        .rotationEffect(.degrees(person.degree))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation(.default) {
                                        person.x = value.translation.width
                                        person.y = value.translation.height
                                        withAnimation {
                                            person.degree = Double((value.translation.width/25))
                                        }
                                    }
                                }
                                .onEnded { value in
                                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)) {
                                        let width = value.translation.width
                                        
                                        if width >= 0 && width <= screenCutoff {
                                            person.x = 0.0
                                            person.y = 0.0
                                            person.degree = 0.0
                                        } else if width <= -1 && width >= -screenCutoff {
                                            person.x = 0.0
                                            person.y = 0.0
                                            person.degree = 0.0
                                        } else if width > screenCutoff {
                                            person.x = 500
                                            person.degree = -12
                                            userManager.swipe(person, .like)
                                        } else if width < -screenCutoff {
                                            person.x = -500
                                            person.degree = 12
                                            userManager.swipe(person, .nope)
                                        }
                                    }
                                }
                        )
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(fullscreenMode: .constant(true), person: Person.example2)
            .environmentObject(UserManager())
    }
}
