//
//  TopPicksRectView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 20..
//

import SwiftUI
import Kingfisher

enum TopPicksType: String {
    case adventurer = "Adventurer"
    case foodie = "Foodie"
    case scholar = "Scholar"
    case traveller = "Traveller"
}

struct TopPicksRectView: View {
    var person: Person
    var type: TopPicksType
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                KFImage(person.imageURLS.first)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 8)
                            .foregroundColor(.gold).shimmer(color: .goldShimmer)
                    }
                
                TrapeziumShape(leadingHeight: 65, trailingHeight: 25)
                    .foregroundColor(.gold).shimmer(color: .goldShimmer)
                    .shadow(radius: 6)
                
                TrapeziumShape(leadingHeight: 50, trailingHeight: 20)
                    .foregroundColor(.white)
                
                HStack {
                    Text(type.rawValue)
                        .foregroundColor(.gold).shimmer(color: .goldShimmer)
                        .font(.system(.headline, design: .rounded))
                        .shadow(color: .goldShimmer, radius: 2, x: 1, y: 2)
                        .padding(10)
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.messageBlue)
                        .font(.system(size: 16))
                        .padding(6)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                        .padding(10)
                }
            }
            .cornerRadius(16)
        }
    }
}

struct TopPicksRectView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksRectView(person: Person.example2, type: .traveller)
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}
