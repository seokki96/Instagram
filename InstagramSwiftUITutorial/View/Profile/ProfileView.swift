//
//  ProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32){
                ProfileHeaderView()
                PostGridView()
            }.padding(.top)
        }
    }
}

#Preview {
    ProfileView()
}
