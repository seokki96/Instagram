//
//  CustomInputView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/25.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    
    // 뷰 모델을 직접 전달하지 않아도 된다
    var action: () -> Void
    
    var body: some View {
        VStack {
            // divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            // hstack
            HStack {
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button (action: action) {
                    Text("Send")
                        .bold()
                        .foregroundStyle(.black)
                }
            }
        }
        .padding(.bottom, 8)
        .padding(.horizontal)
    }
}

//#Preview {
//    CustomInputView(inputText: .constant(""))
//}
