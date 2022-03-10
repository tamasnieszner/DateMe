//
//  CircleImageView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 14..
//

import SwiftUI
import Kingfisher

struct CircleImageView: View {
    var url: URL?
    
    var body: some View {
        KFImage(url)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(url: URL(string: "https://picsum.photos/400"))
    }
}
