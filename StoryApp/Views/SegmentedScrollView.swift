//
//  SegmentedScrollView.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

struct SegmentedScrollView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        ScrollViewReader(content: { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(Tab.allCases.indices, id: \.self) { index in
                        let tab = Tab.allCases[index]
                        
                        Text(tab.rawValue)
                            .foregroundStyle(selectedTab == tab ? .primary : .secondary)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .frame(width: 120)
                            .background {
                                if selectedTab == tab {
                                    if colorScheme == .light {
                                        RoundedRectangle(cornerRadius: 6)
                                            .foregroundStyle(.gray.opacity(0.3))
                                    } else {
                                        RoundedRectangle(cornerRadius: 6)
                                            .foregroundStyle(.white.opacity(0.3))
                                    }
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedTab = tab
                                    proxy.scrollTo(index, anchor: .center)
                                }
                            }
                            .id(index)
                            .fontWeight(.bold)
                    }
                }
            }
        })
        .padding(.horizontal)
    }
}

#Preview {
    SegmentedScrollView(selectedTab: .constant(.all))
}

enum Tab: String, CaseIterable {
    case all = "All"
    case fiction = "Fiction"
    case mystery = "Mystery"
    case romance = "Romance"
    case action = "Action"
    case comedy = "Comedy"
}
