//
//  InstagramSwiftUITutorialApp.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI
import Firebase
@main
struct InstagramSwiftUITutorialApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
        }
    }
}
