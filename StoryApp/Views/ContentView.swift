//
//  ContentView.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @State var activeTab: Tab = .all
    
    var body: some View {
        NavigationStack {
            NavTitleView(title: "Hi Connor", profileImage: "person.fill") {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            MostReadView()
                        }
                        SegmentedScrollView(selectedTab: $activeTab)
                        BookListView(selectedTab: $activeTab)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
