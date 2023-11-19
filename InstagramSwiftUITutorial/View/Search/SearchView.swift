//
//  SearchView.swift
//  InstagramSwiftUITutorial
//
//  Created by SeokkiKwon on 11/19/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            // MARK: - search bar
            
            // MARK: - grid view/user list view
        }
    }
}

#Preview {
    SearchView()
}
