//
//  MessageRowView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 18..
//

import SwiftUI

struct MessageRowView: View {
    var messagePreview: MessagePreview
    
    var body: some View {
        HStack(alignment: .center) {
            CircleImageView(url: messagePreview.person.imageURLS.first)
                .frame(height: 75)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(messagePreview.person.name)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.textPrimary)
                
                Text(messagePreview.lastMessage)
                    .font(.callout)
                    .foregroundColor(.textSecondary)
                    .lineLimit(1)
                
                Divider()
                    .padding(.vertical)
            }
    
            Spacer()
        }
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(messagePreview: MessagePreview.example1)
    }
}
