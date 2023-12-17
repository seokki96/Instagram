//
//  User.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/18.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String? // firestore에 해당 유형을 문서 ID에 매핑
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}
