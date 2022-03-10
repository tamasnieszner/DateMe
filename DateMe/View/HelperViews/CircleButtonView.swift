//
//  CircleButtonView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 02. 02..
//

import SwiftUI

enum ButtonType: String {
    case refresh = "arrow.counterclockwise"
    case nope = "xmark"
    case superlike = "star.fill"
    case like = "heart.fill"
    case boost = "bolt.fill"
}

struct CircleButton: ButtonStyle {
    var inFullScreen: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background {
                if inFullScreen {
                    Circle()
                        .foregroundColor(Color.white)
                } else {
                    Circle()
                        .stroke(lineWidth: 2)
                }
            }
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0) //kicsinyítő animáció
    }
}

struct CircleButtonView: View {
    var type: ButtonType
    var inFullScreen: Bool
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .font(.system(size: 12, weight: .bold))
                .aspectRatio(contentMode: .fit)
                .padding(12)
        }
        .buttonColor(type: type)
        .buttonStyle(CircleButton(inFullScreen: inFullScreen))
        
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            
            CircleButtonView(type: .like, inFullScreen: true) { print("like") }
            .frame(height: 50)
        }
    }
}
