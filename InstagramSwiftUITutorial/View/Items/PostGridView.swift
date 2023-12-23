//
//  PostGridView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    // 각행에 3개의 Grid 항목을 생성
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfiguration
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    var body: some View {
        LazyVGrid(columns: items, spacing:1, content: {
            ForEach(viewModel.posts) { post in
                NavigationLink(destination: FeedView()) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }
            }
        })
    }
}

//#Preview {
//    PostGridView()
//}
