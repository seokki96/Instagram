//
//  ProfileActionButton.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/27/23.
//

import SwiftUI

struct ProfileActionButton: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollwed = false
    var body: some View {
        if viewModel.user.isCurrentUser {
            // edit profile button
            Button(action: {}) {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 360, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
        } else {
            // follow and message button
            HStack {
                Button(action: { isFollwed ? viewModel.unfollow() : viewModel.follow() }) {
                    Text(isFollwed ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollwed ? .black : .white)
                        .background(isFollwed ? .white : .blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: isFollwed ? 1 : 0)
                        )
                }.cornerRadius(3)
                
                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 172, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: 1)
                        )
                }
            }
        }
    }
}

//#Preview {
//    ProfileActionButton()
//}
