//
//  UserService.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/21.
//

import Firebase
// 기능을 여러곳에서 사용하는 경우 서비스로직을 분리
// ((Error?) -> Void)? firebase에서 작업이 완료되면 해당 형태로 completion 핸들러를 반환
struct UserService {
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_FOLLWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLWERS.document(uid).collection("user-followers")
                .document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLWING.document(currentUid).collection("user-following")
            .document(uid).delete { _ in
                COLLECTION_FOLLWERS.document(uid).collection("user-followers")
                    .document(currentUid).delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLWING.document(currentUid).collection("user-following")
            .document(uid).getDocument { snapShot, _ in
                guard let isFollowed = snapShot?.exists else { return }
                print(isFollowed)
                completion(isFollowed)
            }
    }
}
