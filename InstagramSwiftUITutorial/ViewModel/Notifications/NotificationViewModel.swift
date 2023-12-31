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
    
    func fetchNotifications() {}
    
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
