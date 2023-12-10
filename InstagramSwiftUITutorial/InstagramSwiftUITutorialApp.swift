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
            ContentView().environmentObject(AuthViewModel.shared)
//            LoginView().environmentObject(AuthViewModel())
            // 초기화된 뷰모델을 환경객체에 추가해줘야 하위뷰에서 해당 뷰모델을 사용할 수 있다
        }
    }
}
