//
//  ContentView.swift
//  DateMe
//
//  Created by Tamás Nieszner on 2022. 01. 14..
//

import SwiftUI
import LookingGlassUI

struct ContentView: View {
    @ObservedObject var appStateManager: AppStateManager = AppStateManager()
    @ObservedObject var userManager: UserManager = UserManager()
    
    var body: some View {
        MainView()
            .environmentObject(appStateManager)
            .environmentObject(userManager)
            .motionManager(updateInterval: 0.1, disabled: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
