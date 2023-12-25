//
//  FeedView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ScrollView {
            /**
            # LazyVstack
            - 화면에서 로드될때만 메모리에 항목을 로드
            - 이미지 캐시 기능(필요할때 다시 꺼냄)
            - 실제로 네트워크 호출이 이루어질때 부드러운 스크롤을 제공
             */
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }.padding(.top)
        }
    }
}

#Preview {
    FeedView()
}
