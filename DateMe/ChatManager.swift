//
//  ChatManager.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 17..
//

import UIKit
import Combine

class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing: Bool = false
    
    var cancellable: AnyCancellable? = nil
    
    private var person: Person
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({ _ in true })
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({ _ in false })
    
    init(person: Person) {
        self.person = person
        fetchMessages()
        configurePublishers()
    }
    
    private func configurePublishers() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    public func sendMessage(_ message: Message) {
        //networking
        messages.append(message)
        //if networking failed show an error with some retry option
    }
    
    private func fetchMessages() {
        //networking
        messages = [Message.exampleSent, Message.exampleRecieved]
    }
    
    deinit {
        cancellable?.cancel()
    }
}
