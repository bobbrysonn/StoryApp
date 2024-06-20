//
//  BookListView.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

struct BookListView: View {
    @Binding var selectedTab: Tab
    
    var vm = DataManager.shared
    
    var currentBooks: [Book] {
        if let category = vm.categories.first(where: { $0.name.lowercased() == selectedTab.rawValue.lowercased() }) {
            return category.books
        } else {
            return []
        }
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(spacing: -10), count: 2)) {
            ForEach(currentBooks, id: \.title) { book in
                NavigationLink {
                    BookDetailView(book: book)
                } label: {
                    BookView(book: book)
                }
            }
        }
    }
}

#Preview {
    BookListView(selectedTab: .constant(.all))
}
