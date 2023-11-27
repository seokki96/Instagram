//
//  UserStatView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/27/23.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15, weight: .semibold))
        }.frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStatView(value: 1, title: "Follwers")
}
