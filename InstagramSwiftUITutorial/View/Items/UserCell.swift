//
//  UserCell.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI
import Kingfisher
struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            // MARK: - image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .cornerRadius(24)
                .clipShape(Circle())
                
                
            // MARK: - username, fullname
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

//#Preview {
//    UserCell()
//}
