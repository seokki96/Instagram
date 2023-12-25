//
//  CommentViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/25.
//

import SwiftUI
import Firebase
class CommentViewModel: ObservableObject {
    @Published var comments = [Comment]()
    private let post: Post
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    func uploadCommnet(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String : Any] = ["username" : user.username,
                    "profileImageUrl": user.profileImageUrl,
                    "uid":user.id ?? "",
                    "timestamp": Timestamp(date: Date()),
                    "postOwnerUid": post.ownerUid,
                    "commentText" : commentText]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: Error uploading comment: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func fetchComments() {
        guard let postId = post.id else { return }
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by: "timestamp", descending: false)
        
        // 리스너를 추가하여 실시간 데이터 가져오기
        query.addSnapshotListener { snapShot, _ in
            guard let addedDocs = snapShot?.documentChanges.filter({ $0.type == .added}) else { return }
            self.comments += addedDocs.compactMap({try? $0.document.data(as: Comment.self)})
            
//            snapShot?.documentChanges.forEach({ change in
//                if change.type == .added {
//                    guard let comment = try? change.document.data(as: Comment.self) else { return }
//                    self.comments.append(comment)
//                }
//            })
        }
    }
}
