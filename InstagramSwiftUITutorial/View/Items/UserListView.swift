//
//  UserListView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filterdUsers(searchText)
    }
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(users) { user in
                    NavigationLink(destination: ProfileView(user: user)) {
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
