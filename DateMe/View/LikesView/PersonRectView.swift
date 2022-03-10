//
//  PersonRectView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 19..
//

import SwiftUI
import Kingfisher

struct PersonRectView: View {
    var person: Person
    var blurred: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                KFImage(person.imageURLS.first)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .if(blurred) {
                        $0.blur(radius: 30)
                    }
                
                HStack {
                    Text(person.name)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    if !blurred {
                        Text("\(person.age)")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                    }
                }
                .foregroundColor(.white)
                .shadow(radius: 4)
                .padding(10)
                .if(blurred) {
                    $0.redacted(reason: .placeholder)
                }
            }
            .cornerRadius(16)
        }
    }
}

struct PersonRectView_Previews: PreviewProvider {
    static var previews: some View {
        PersonRectView(person: Person.example1, blurred: false)
            .previewLayout(.sizeThatFits)
    }
}
