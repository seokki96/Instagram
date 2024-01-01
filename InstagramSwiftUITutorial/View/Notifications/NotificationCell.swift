//
//  NotificationCell.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    @State private var showPostImage = true
    
    var isFollwed: Bool {
        return viewModel.notification.isFollowed ?? false
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: viewModel.notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            
            Text(viewModel.notification.username).font(.system(size: 14, weight: .semibold)) +
            Text(" \(viewModel.notification.type.notificationMessage)")
                    .font(.system(size: 15))
            Spacer()
            if viewModel.notification.type != .follow {
                Image("sample01")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
            } else {
                Button(action: { isFollwed ? viewModel.unfollow() : viewModel.follow() }) {
                    Text(isFollwed ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollwed ? .black : .white)
                        .background(isFollwed ? .white : .blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: isFollwed ? 1 : 0)
                        )
                        
                }
            }
        }.padding(.horizontal)
    }
}

//#Preview {
//    NotificationCell()
//}
