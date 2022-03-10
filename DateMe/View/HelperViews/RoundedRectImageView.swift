//
//  RoundedRectImageView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 21..
//

import SwiftUI
import Kingfisher

struct RoundedRectImageView: View {
    var url: URL?
    var blurred: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            KFImage(url)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .if(blurred) {
                    $0.blur(radius: 30)
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

struct RoundedRectImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectImageView(url: URL(string: "https://picsum.photos/400/300"))
    }
}
