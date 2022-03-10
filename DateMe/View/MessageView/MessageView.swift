//
//  MessageView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 17..
//

import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        HStack {
            if message.fromCurrentUser {
                ChatBubble(direction: .right) {
                    Text(message.content)
                        .padding(14)
                        .foregroundColor(.white)
                        .background(Color.messageBlue)
                }
            } else if !message.fromCurrentUser {
                ChatBubble(direction: .left) {
                    Text(message.content)
                        .padding(14)
                        .foregroundColor(.black)
                        .background(Color.messageGray)
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message.exampleSent)
    }
}
