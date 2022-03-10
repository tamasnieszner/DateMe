//
//  MessageListView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 18..
//

import SwiftUI
import LookingGlassUI

struct MessageListView: View {
    @ObservedObject var viewModel = MessageListViewModel()
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                //search
                TextField("Search Matches", text: $searchText)
                    .padding(8)
                    .padding(.leading, 30)
                    .background(Color.textFieldBackground)
                    .cornerRadius(8)
                    .overlay {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.textSecondary)
                                .font(.system(size: 18, weight: .bold))
                                .padding(.leading, 8)
                            Spacer()
                        }
                    }
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .padding(.horizontal, 10)
                
                if isEditing {
                    Text("Cancel")
                        .foregroundColor(.primaryPink)
                        .padding(.leading, 5)
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .onTapGesture {
                            self.isEditing = false
                            self.searchText = ""
                            self.hideKeyboard()
                        }
                }
            }
            .animation(.easeIn(duration: 0.25), value: isEditing)
            
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 0) {
                        //matches
                        Group {
                            if !isEditing {
                                Text("New matches")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primaryPink)
                                    .padding(.horizontal)
                                
                                MatchesView()
                            }
                        }
                        
                        Divider()
                        
                        //messages
                        Group {
                            Text("Messages")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.primaryPink)
                                .padding()
                            
                            VStack {
                                ForEach(viewModel.messagePreviews.filter({ searchText.isEmpty ? true : displayPreview($0) }), id: \.self) { message in
                                    NavigationLink {
                                        ChatView(person: message.person)
                                    } label: {
                                        MessageRowView(messagePreview: message)
                                    }
                                    .transition(.slide)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    
                    if isEditing && searchText.isEmpty {
                        Color.transparentBackground
                    }
                }
            }
            .animation(.easeIn(duration: 0.25), value: isEditing)
            .animation(.easeIn(duration: 0.25), value: searchText)
        }
        .modifier(HideNavigationBar())
    }
    
    func displayPreview(_ preview: MessagePreview) -> Bool {
        if preview.person.name.range(of: searchText, options: .caseInsensitive) != nil { return true }
        if preview.lastMessage.contains(searchText) { return true }
        if preview.person.bio.range(of: searchText, options: .caseInsensitive) != nil { return true }
        return false
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}
