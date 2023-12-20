//
//  ProfileViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return } // 팔로우를 하려는 상대의 uid
        UserService.follow(uid: uid) { _ in
            print("Successfully follwed \(self.user.username)")
        }
    }
    
    func unfollow() {
        print("DEBUG: Unfollow user...")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
