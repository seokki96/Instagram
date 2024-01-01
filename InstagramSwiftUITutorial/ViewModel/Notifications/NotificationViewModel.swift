//
//  NotificationViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/31.
//

import SwiftUI
import Firebase
class NotificationViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        // 현재 사용자의 uid를 가져온다.
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // user-notifications 컬렉션에서 현재 로그인한 유저의 uid에 해당하는 문서를 찾는다
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            self.notifications = documents.compactMap({try? $0.data(as: Notification.self)})
            print(self.notifications)
        }
    }
    
    // 알림을 서버에 업로드
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
//        guard let postId = post?.id else { return }
        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "uid": user.id ?? "",
                                   "profileImageUrl": user.profileImageUrl,
                                   "type": type.rawValue]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
