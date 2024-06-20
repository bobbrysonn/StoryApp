//
//  NavLinkView.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

struct NavLinkView<Content: View>: View {
    @Environment(\.dismiss) var dismiss
    @State var Yoffset = 0.0
    
    var title: String
    var content: Content
    var action: () -> Void
    
    init(title: String, @ViewBuilder content: () -> Content, action: @escaping () -> Void) {
        self.title = title
        self.content = content()
        self.action = action
    }
    
    var body: some View {
        content
            .ignoresSafeArea()
            .background {
                GeometryReader { geometry in
                    Color.clear.preference(key: ScrollOffsetKey.self, value: geometry.frame(in: .global).minY)
                }
            }
            .safeAreaPadding(.top)
            .onPreferenceChange(ScrollOffsetKey.self, perform: { value in
                Yoffset = max(0.8, min(1, value / 100))
            })
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .scaleEffect(Yoffset)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    bookMark
                }
            }
        
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .bold()
                .foregroundStyle(.white)
                .frame(width: 55, height: 55)
                .background(.ultraThinMaterial, in: Circle())
                .scaleEffect(Yoffset)
        }
    }
    
    private var bookMark: some View {
        Button {
            action()
        } label: {
            Image(systemName: "bookmark")
                .bold()
                .foregroundStyle(.white)
                .frame(width: 55, height: 55)
                .background(.ultraThinMaterial, in: Circle())
                .scaleEffect(Yoffset)
        }
    }
    
}

private struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
