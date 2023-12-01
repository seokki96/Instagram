//
//  ImagePicker.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 12/1/23.
//

import Foundation
import SwiftUI

// 뷰컨트롤럴를 추출하여 SwiftUI로 나타낸다
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    // 필요로하는 뷰컨트롤러 생성
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    // 뷰컨트롤러에서 발생한 작업을 처리하는 방법
    // UIViewController에 대한 처리는 SwiftUI에서 일어나기 때문에 중간에서 조정해주는 역할
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else {return}
            self.parent.image = image
            self.parent.mode.wrappedValue.dismiss()
        }
    }
}
