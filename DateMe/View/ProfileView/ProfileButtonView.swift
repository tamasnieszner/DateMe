//
//  ProfileButtonView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 14..
//

import SwiftUI

struct ProfileButtonView: View {
    var title: String
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .foregroundColor(.buttonGray)
                .font(.system(size: 20, weight: .bold))
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(radius: 6)
                .onTapGesture {
                    self.action()
                }
            
            Text(title.uppercased())
                .font(.caption)
                .foregroundColor(.buttonGray)
        }
    }
}

struct ProfileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtonView(title: "settings", imageName: "gearshape.fill") {
            //button action
        }
    }
}
