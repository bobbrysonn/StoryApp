//
//  BookDetailView.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

struct BookDetailView: View {
    @State var isShowingStory = false
    
    let book: Book
    
    var body: some View {
        NavLinkView(title: book.title) {
            ZStack {
                GeometryReader { proxy in
                    Image(book.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                }
                
                /* Details view */
                VStack(alignment: .leading, spacing: 24) {
                    Text(book.title)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    
                    HStack {
                        Text("By Connor")
                        LineView()
                        Text("Published June 4th, 2024")
                    }
                    .foregroundStyle(.secondary)
                    
                    /* Reads, likes and pages */
                    HStack {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Reads")
                                .foregroundStyle(.secondary)
                            Text("2.4M")
                                .bold()
                        }
                        
                        Spacer()
                        LineView()
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Likes")
                                .foregroundStyle(.secondary)
                            Text("14.3K")
                                .bold()
                        }
                        
                        Spacer()
                        LineView()
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Pages")
                                .foregroundStyle(.secondary)
                            Text("60")
                                .bold()
                        }
                    }
                    
                    /* About stuff */
                    Text("About \(book.title)")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    Text("\(book.description)")
                        .foregroundStyle(.secondary)
                        .lineLimit(5)
                }
                .padding()
                .padding(.vertical, 20)
                .padding(.bottom, 60)
                .background(.ultraThinMaterial)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .overlay(alignment: .bottom) {
                    Button {
                        withAnimation {
                            isShowingStory = true
                        }
                    } label: {
                        Text("Start Reading")
                            .bold()
                            .frame(width: 250, height: 50)
                            .background(.white, in: .rect(cornerRadius: 12))
                            .foregroundStyle(.black)
                    }
                    .padding(.bottom, 25)
                }
            }
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $isShowingStory) {
                StoryView(book: book)
            }
        } action: {
            
        }
    }
}

private struct LineView: View {
    var body: some View {
        Rectangle()
            .frame(width: 1, height: 35)
    }
}

#Preview {
    BookDetailView(book: .init(title: "Aladdin", image: "desert_landscape", rating: 5.6, description: "Over the sea something happened the other night. And this book is about the conspicuous happenings of that night and that evening as chaos unfolded and reality bend to nothingness. Chaos indeed so", story: "Over the sea something happened the other night. And this book is about the conspicuous happenings of that night and that evening as chaos unfolded and reality bend to nothingness. Chaos indeed so"))
}
