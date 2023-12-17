//
//  ProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack(spacing: 32){
                ProfileHeaderView(user: user)
                PostGridView()
            }.padding(.top)
        }
    }
}

//#Preview {
//    ProfileView()
//}
