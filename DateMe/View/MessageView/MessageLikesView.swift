//
//  MessageLikesView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 21..
//

import SwiftUI

struct MessageLikesView: View {
    var body: some View {
        
        ZStack(alignment: .bottom) {
            RoundedRectImageView(url: URL(string: "https://picsum.photos/400"), blurred: true)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 4)
                        .foregroundColor(.gold).shimmer(color: .goldShimmer)
                }
        
            Image(systemName: "heart.fill")
                .font(.system(size: 32))
                .foregroundColor(.white)
                .offset(y: 14)
            
            Image(systemName: "heart.fill")
                .font(.system(size: 25))
                .foregroundColor(.gold).shimmer(color: .goldShimmer)
                .offset(y: 10)
        }
    }
}

struct MessageLikesView_Previews: PreviewProvider {
    static var previews: some View {
        MessageLikesView()
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}
