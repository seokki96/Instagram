//
//  LoginView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 12/4/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // 탐색 스택을 추가 NavigationController의 역할
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea() // SafeArea 영역무시
                
                VStack {
                    Image("instagram_logo_white")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                        .padding(.top, 32)
                    
                    VStack(spacing: 20){
                        // email field
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
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
                    // forgot password
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Text("Forgot Password")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .padding(.trailing, 28)
                        })
                       
                    }
                    // sign in
                    // frame을 설정하고 나서 배경색을 설정해야한다
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(.purple))
                            .clipShape(Capsule())
                    })
                    // go to sign up
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView()
                        .navigationBarHidden(true)) {
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }.foregroundColor(.white)
                            .padding(.bottom, 32)
                    }
                  
                  
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
