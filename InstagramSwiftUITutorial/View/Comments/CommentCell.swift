//
//  CommentCell.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/25.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("sample01")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("sinheysun").font(.system(size: 14, weight: .semibold)) +
          
            Text("some text comment for now").font(.system(size: 14))
            Spacer()
            
            Text("2m")
                .foregroundStyle(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}

#Preview {
    CommentCell()
}
