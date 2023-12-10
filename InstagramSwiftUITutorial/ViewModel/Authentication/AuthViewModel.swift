//
//  AuthViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 12/10/23.
//

import SwiftUI
import Firebase

// 뷰모델에서 네트워크에 데이터 변경을 요청 -> 요청되고 변경된 데이터로 UI를 업데이트
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    // 공유 인스턴스로 공유된 객체에 접근가능 EnvirmentObject 방식을 사용해도됨
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed Login \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        guard let image = image else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                self.userSession = user
                print("Succesfully registerd user...")
                
                // DB에 유저정보 저장
                let data = [
                    "email": email,
                    "username": username,
                    "fullname": fullname,
                    "profileImageUrl": imageUrl,
                    "uid": user.uid
                ]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("Succesfully uploaded user data...")
                    self.userSession = user
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
