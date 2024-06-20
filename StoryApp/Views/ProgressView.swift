//
//  ProgressView.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

#Preview {
    ProgressView {
        Text("")
    }
}


struct ProgressView<Content:View>: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var contentHeight: CGFloat = 0
    
    var content:Content
    
    init( @ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollViewReader(content: { scrollproxy in
            //1
            GeometryReader(content: { fullview in
                ZStack(alignment:.top){
                    ScrollView{
                        //3
                        GeometryReader(content: { ScrollViewGeo in
                            Color.clear.preference(key: ScrollOffsetKey.self, value: ScrollViewGeo.frame(in: .global).minY)
                        })
                        .frame(height: 0) .id(0)
                        VStack{
                        content
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        //2
                        .background(GeometryReader{ contentGeo in
                            Color.clear.preference(key: ContentHeightPreferenceKey.self, value: contentGeo.size.height)
                        })
                    }
                    .scrollIndicators(.hidden)
                    .onPreferenceChange(ScrollOffsetKey.self){
                        self.scrollOffset = $0 - fullview.safeAreaInsets.top
                    }
                    .onPreferenceChange(ContentHeightPreferenceKey.self){
                        self.contentHeight = $0
                    }
                    progreeView(fullView: fullview, ScrollProxy: scrollproxy)
                   
                  
                }
             })
        })
    }
    
    func progreeView(fullView:GeometryProxy,ScrollProxy :ScrollViewProxy) -> some View{
        let progress = min(max(0, -scrollOffset / (contentHeight - fullView.size.height)), 1)
        let progressPercentage = Int(progress * 100)
        return ZStack{
            Group{
                ZStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 250, height: 55)
                        .foregroundStyle(.black)
                    HStack{
                        Text("\(progressPercentage)%").bold()
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 150 * progress, height: 8)
                        
                    }
                    .foregroundStyle(.white)
                    .padding(.leading,20)
                    .opacity(progressPercentage > 0 && progressPercentage < 100 ? 0.8 : 0)
                    .animation(.easeInOut, value: progressPercentage)
                     
                     
                }
             }
            .opacity(progressPercentage > 0 ? 1 : 0)
            Button(action: {
                withAnimation(.easeInOut(duration: 5)) {
                    ScrollProxy.scrollTo(0,anchor: .top)
                }
            }, label: {
                Image(systemName: "arrow.up").font(.title)
                    .bold().foregroundStyle(.white)
                    .frame(width: 55, height: 55)
            })
            .offset(y: progressPercentage == 100 ? 0 : 100)
            .animation(.easeInOut, value: progressPercentage)
        }
        .mask(
            RoundedRectangle(cornerRadius: 40)
            .frame(width: progressPercentage > 0 && progressPercentage < 100 ? 250 : 55, height: 55)
            .animation(.easeInOut, value: progressPercentage)

        )
        .frame(maxHeight: .infinity,alignment: .bottom)
    }
   
}
private struct ScrollOffsetKey:PreferenceKey{
    static var defaultValue :CGFloat = 0
    static func reduce (value:inout CGFloat,nextValue nexValue : () -> CGFloat){
        value = nexValue()
    }
}
struct ContentHeightPreferenceKey:PreferenceKey {
    static var defaultValue :CGFloat = 0
    static func reduce (value:inout CGFloat,nextValue nexValue : () -> CGFloat){
        value = max(value, nexValue())
    }
}

//#Preview {
//    ContentView<<#Content: View#>>()
//}
