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
    
    func fetchNotificationPost() {}
}
