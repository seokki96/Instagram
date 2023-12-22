//
//  ImageUploader.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 12/10/23.
//

import UIKit
import Firebase
import FirebaseStorage

// enum을 활용하여 스토리지 경로를 반환
enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
           return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post:
           return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
    }
}

// UIKit의 UIImage를 사용해야 JPEG 형식으로 압축이 가능
struct ImageUploader {
    
    static func uploadImage(image: UIImage, type: UploadType,  completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let ref = type.filePath
        
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
