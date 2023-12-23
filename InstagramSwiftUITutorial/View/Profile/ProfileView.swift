//
//  ProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    // @ObservedObject var viewModel: ProfileViewModel = ProfileViewModel(user: user) 대신 아래처럼 init을 이용한다
    
    // 리스트에서 받아온 유저정보로 ProfileViewModel 인스턴스를 생성
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32){
                ProfileHeaderView(viewModel: viewModel)
                PostGridView(config: .profile(user.id ?? ""))
            }.padding(.top)
        }
    }
}

//#Preview {
//    ProfileView()
//}
