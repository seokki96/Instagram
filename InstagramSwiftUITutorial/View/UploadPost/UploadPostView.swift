//
//  UploadPostView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct UploadPostView: View {
    // UIImage -> UIKit에서 이미지를 보여주기 위한 데이터 객체
    // Image -> SwiftUI에서 이미지를 보여주기 위한 데이터 객체
    @State private var selectedImage: UIImage?
    @State var postImage: Image? // 받아온 이미지를 받기위한?
    @State var captionText = ""
    @State var imagePickerPresented = false
    var body: some View {
        VStack {
            if postImage == nil {
                // 상태변수가 변경되면 관련된 뷰에있는 모든 코드가 재구성됨
                // 버튼을 클릭하면 imagePickerPresented값을 변경
                Button(action: {imagePickerPresented.toggle()}) {
                    Image("plus_button")
                        .renderingMode(.template) // 이미지의 색상을 사용자가 정의할 수 있음
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                    // imagePickerPresented 변수가 true라면 sheet를 표현
                }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption..", text: $captionText)
                } .padding()
                Button(action: {}, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                })
                .padding()
            }
            Spacer()
        }
    }
}

extension UploadPostView {
    // 작업을 닫은경우 loadImage 호출
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        // 이미지가 존재하는 경우 postImage에 선택된 이미지 값을 바인딩
        postImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    UploadPostView()
}
