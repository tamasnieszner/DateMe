//
//  ChatView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 17..
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager: ChatManager
    @State var typingMessage: String = ""
    @State var scrollProxy: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 75)
                
                //messages body
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        LazyVStack {
                            ForEach(chatManager.messages.indices, id: \.self) { index in
                                let message = chatManager.messages[index]
                                MessageView(message: message).id(index)
                            }
                        }
                        .onAppear {
                            scrollProxy = proxy
                        }
                    }
                }
                
                ZStack(alignment: .trailing) {
                    //textfield background color
                    Color.textFieldBackground
                    
                    //textfield
                    TextField("Type a message", text: $typingMessage)
                        .foregroundColor(.textSecondary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    Button {
                        sendMessage()
                    } label: {
                        Text("Send")
                    }
                    .disabled(typingMessage.isEmpty)
                    .foregroundColor(typingMessage.isEmpty ? .textSecondary : .messageBlue)
                    .padding(.horizontal)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray.opacity(0.35), lineWidth: 1)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            //header
            ChatHeaderView(name: person.name, imageURL: person.imageURLS.first) {
                print("video")
            }
        }
        .modifier(HideNavigationBar())
        .onChange(of: chatManager.keyboardIsShowing) { showing in
            if showing {
                scrollToBottom()
            }
        }
        .onChange(of: chatManager.messages) { _ in
            scrollToBottom()
        }
    }
    
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(chatManager.messages.count-1, anchor: .bottom)
        }
    }
    
    func sendMessage() {
        chatManager.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example1)
    }
}
