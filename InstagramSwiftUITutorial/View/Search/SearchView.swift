//
//  SearchView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    @ObservedObject var viewModel = SearchViewModel()
    var body: some View {
        ScrollView {
            
            // MARK: - search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            // MARK: - grid view/user list view
            // 검색모드 상태에 따라서 뷰를 결정
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView()
                }
            }
            
        }
    }
}

#Preview {
    SearchView()
}
