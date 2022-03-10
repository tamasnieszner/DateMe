//
//  CardStackView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 02. 08..
//

import SwiftUI

struct CardStackView: View {
    @State private var fullscreenMode: Bool = false
    
    var people: [Person]
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(fullscreenMode: $fullscreenMode, person: person)
            }
        }
        .frame(width: screen.width, height: fullscreenMode ? screen.height : 550)
    }
}

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView(people: Person.examples)
    }
}
