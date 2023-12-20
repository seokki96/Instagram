//
//  UserService.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/21.
//

import Firebase

struct UserService {
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLWERS.document(uid).collection("user-follwers")
                .document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unfollow() {
        
    }
    
    static func checkIfUserIsFollowed() {
        
    }
}
