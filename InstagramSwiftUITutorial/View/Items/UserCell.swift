//
//  UserCell.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // MARK: - image
            Image("sample01")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .cornerRadius(24)
                .clipShape(Circle())
                
                
            // MARK: - username, fullname
            VStack(alignment: .leading) {
                Text("sinheyseon")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("dd")
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

#Preview {
    UserCell()
}
