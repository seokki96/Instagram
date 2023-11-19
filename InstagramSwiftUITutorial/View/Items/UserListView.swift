//
//  UserListView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0 ..< 20) { _ in
                    NavigationLink(destination: ProfileView()) {
                        UserCell()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    UserListView()
}
