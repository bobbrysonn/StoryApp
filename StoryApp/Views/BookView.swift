//
//  BookView.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

struct BookView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let book: Book
    
    var body: some View {
        Image(book.image)
            .resizable()
            .scaledToFill()
            .frame(width: 176, height: 260)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(alignment: .bottom) {
                UnevenRoundedRectangle(bottomLeadingRadius: 12, bottomTrailingRadius: 12)
                    .frame(height: 40)
                    .foregroundStyle(
                        colorScheme == .dark ? .thinMaterial : .ultraThin
                    )
                
                Text(book.title)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .frame(width: 150)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .overlay(alignment: .topTrailing) {
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.orange)
                    Text("\(String(format: "%.1f", book.rating))")
                        .foregroundStyle(.black)
                    
                }
                .offset(x: -2)
                .font(.system(size: 11))
                .fontWeight(.bold)
                .frame(width: 49, height: 22)
                .background(.white, in: .rect(cornerRadius: 20))
                .padding(12)
            }
    }
}

#Preview {
    BookView(book: .init(title: "Aladdin", image: "medieval_marketplace", rating: 4.7, description: "Something", story: "Something"))
}
