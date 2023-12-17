//
//  SearchViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/18.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapShot, _ in
            // error가 발생할 경우 빈배열
            guard let documents = snapShot?.documents else { return }
            let users = documents.compactMap {try?  $0.data(as: User.self)}
            print(users)
            self.users = users
        }
    }
}
