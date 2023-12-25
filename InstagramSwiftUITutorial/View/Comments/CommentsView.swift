//
//  CommentsView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokKi Kwon on 2023/12/25.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
    
    init(post: Post) {
        viewModel = CommentViewModel(post: post)
    }
    var body: some View {
        VStack {
            // comment cells
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                            CommentCell(comment: comment)
                    
                    }
                }
            }.padding(.top)
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        viewModel.uploadCommnet(commentText: commentText)
        commentText = ""
    }
}

//#Preview {
//    CommentsView()
//}
