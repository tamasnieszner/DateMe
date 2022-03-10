//
//  MessageListViewModel.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 18..
//

import Foundation

class MessageListViewModel: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        //networking
        messagePreviews = [MessagePreview.example1, MessagePreview.example2]
    }
}
