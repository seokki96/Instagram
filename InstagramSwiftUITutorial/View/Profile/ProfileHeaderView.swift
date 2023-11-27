//
//  ProfileHeaderView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/27/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("sample01")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding()
                Spacer()
                HStack(alignment:.center, spacing: 16){
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Follwers")
                    UserStatView(value: 1, title: "Following")
                }.padding(.trailing)
            }
            
            Text("Bruce Wayne")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gotham's Dark Knight || Billionaire")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            
            HStack{
                Spacer()
                ProfileActionButton()
                Spacer()
            }
        }
    }
}



#Preview {
    ProfileHeaderView()
}
