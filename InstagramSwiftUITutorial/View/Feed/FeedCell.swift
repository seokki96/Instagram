//
//  FeedCell.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            // usre info
            HStack {
                Image("sample01")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("sinheyseon")
                    .font(.system(size: 14))
            }
            .padding([.leading, .bottom], 8)
            
            // MARK: - post image
            // maxHeight로 지정해서 사진의 크기에따라 자동으로 크기를 조절
            // cliped로 컨텐츠가 이미지뷰를 넘어가지 않도록 설정
            Image("sample01")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            // MARK: - action buttons
            HStack(spacing: 16) {
                Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 14))
                    
                }.padding(4)
                
                Button(action: {}) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 14))
                    
                }.padding(4)
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 14))
                    
                }.padding(4)
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            // MARK: - cations
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 4)
            HStack {
                Text("batman").font(.system(size: 14, weight: .semibold)) +
                Text("All men have limits. They learn whar they are and learn not to excced them. I ignore mine")
                    .font(.system(size: 15))
            }.padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding([.leading, .top], 8)
        }
    }
}

#Preview {
    FeedCell()
}
