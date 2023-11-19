//
//  PostGridView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct PostGridView: View {
    // 각행에 3개의 Grid 항목을 생성
    private var items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing:2, content: {
            ForEach(0..<10) { _ in
                NavigationLink(destination: FeedView()) {
                    Image("sample01")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }
            }
        })
    }
}

#Preview {
    PostGridView()
}
