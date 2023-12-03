//
//  CustomTextField.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 12/4/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    var body: some View {
        ZStack(alignment: .leading, content: {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        })
    }
}

#Preview {
    CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
}
