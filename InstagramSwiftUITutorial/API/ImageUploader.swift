//
//  ImageUploader.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 12/10/23.
//

import UIKit
import Firebase
import FirebaseStorage

// UIKit의 UIImage를 사용해야 JPEG 형식으로 압축이 가능
struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)") // 이미지가 저장되는 경로
        
        ref.putData(imageData, metadata: nil) { meta, error in
            if let error = error {
                print("DEBUG: Failed to upload image : \(error.localizedDescription)")
                return
            }
            
            print("Succesfully upload image...")
            ref.downloadURL { url, _ in
                guard let url = url?.absoluteString else { return }
                completion(url)
            }
        }
    }
}
