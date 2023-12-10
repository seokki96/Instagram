//
//  RegistrationView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 12/4/23.
//

import SwiftUI

/**
 Environment 뷰 환경에서 값을 읽는 속성 래퍼
 */

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image? // 받아온 이미지를 받기위한?
    @State private var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea() // SafeArea 영역무시
            
            VStack {
                // 선택한 이미지가 존재하는경우
                if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .padding()
                    
                } else {
                    // 이미지가 없는경우 이미지 업로드버튼
                    Button(action: { imagePickerPresented.toggle() }, label: {
                        Image("plus_button")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })
                            .padding()
                    })
                }
                VStack(spacing: 20){
                    // email field
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white:1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    // email field
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white:1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    // email field
                    CustomTextField(text: $fullname, placeholder: Text("Full name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white:1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    // password field
                    CustomSecureField(text: $password, placeholder: Text("password"))
                        .padding()
                        .background(Color(.init(white:1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                // sign in
                // frame을 설정하고 나서 배경색을 설정해야한다
                Button(action: { 
                    viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(.purple))
                        .clipShape(Capsule())
                        .padding()
                })
                // go to sign up
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                        .padding(.bottom, 16)
                })
                
            }
        }
    }
}

extension RegistrationView {
    // 작업을 닫은경우 loadImage 호출
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        // 이미지가 존재하는 경우 postImage에 선택된 이미지 값을 바인딩
        image = Image(uiImage: selectedImage)
    }
}

#Preview {
    RegistrationView()
}
