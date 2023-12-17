//
//  UserListView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(viewModel.users) { user in
                    NavigationLink(destination: ProfileView()) {
                        UserCell(user: user)
                    }
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    UserListView()
//}
