//
//  StoryView.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

struct StoryView: View {
    @Environment(\.dismiss) var dismiss
    
    var book: Book
    
    var body: some View {
        ProgressView {
            Text(book.story)
                .safeAreaPadding(.top, 50)
        }
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .bold()
                    .frame(width: 50, height: 50)
                    .background(.ultraThinMaterial, in: Circle())
                    .offset(x: 24, y: -5)
            }
            .foregroundStyle(.primary)
        }
    }
}
