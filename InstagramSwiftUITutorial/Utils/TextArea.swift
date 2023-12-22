//
//  TextArea.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
//        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .padding(4)
        }
        .font(.body)
    }
}

//#Preview {
//    TextArea()
//}
