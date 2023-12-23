//
//  PostGridViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/24.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPost(forConfig: config)
    }
    
    
    func fetchPost(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePagePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePagePosts() {
        COLLECTION_POSTS.getDocuments { snapShot, error in
            guard let document = snapShot?.documents else { return }
            self.posts = document.compactMap {(try? $0.data(as: Post.self))}
        }
    }
    
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapShot, _ in
            guard let document = snapShot?.documents else { return }
            self.posts = document.compactMap {(try? $0.data(as: Post.self))}
        }
    }
}
