//
//  Comment.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/25.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
}
