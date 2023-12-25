//
//  FeedCellViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/25.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        // 현재 post의 post-likes 라는 컬렉션 하위에 현재 유저의 uid를 추가
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]) { _ in
            // 현재 유저의 문서에 user-likes에 postId를 추가
            COLLECTION_USERS.document(uid).collection("user-likes")
                .document(postId).setData([:]) { _ in
                    // 현재 post의 likes 업데이트
                    COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                    // UI를 업데이트 하기위한 데이터 업데이트
                    self.post.didLike = true
                    self.post.likes += 1
                }
        }
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(uid).delete { _ in
                COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                    COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                    self.post.didLike = false
                    self.post.likes -= 1
                }
            }
    }
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        // 현재유저의 user-likes에 현재 포스트가 존재한다면 didLike를 true로 변경
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapShot, _ in
            guard let didLike = snapShot?.exists else { return }
            self.post.didLike = didLike
        }
    }
}
