//
//  FeedViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapShot, error in
            guard let document = snapShot?.documents else { return }
            self.posts = document.compactMap {(try? $0.data(as: Post.self))}
        }
    }
    
}
