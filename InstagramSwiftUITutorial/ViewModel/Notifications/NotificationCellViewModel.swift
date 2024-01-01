//
//  NotificationCellViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2024/01/01.
//

import Foundation

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    // notification 뷰모델을 따로 생성
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            NotificationViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        // notification type이 follow타입인 경우에만 API를 호출
        guard notification.type == .follow else { return }
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
    func fetchNotificationPost() {
        guard let postId = notification.postId else { return }
        COLLECTION_POSTS.document(postId).getDocument { snapShot, _ in
            self.notification.post = try? snapShot?.data(as: Post.self)
        }
    }
    
    func fetchNotificationUser() {
        COLLECTION_USERS.document(notification.uid).getDocument { snapShot, _ in
            self.notification.user = try? snapShot?.data(as: User.self)
            print("DEBUG: User is \(self.notification.user?.username)")
        }
    }
}
