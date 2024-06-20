//
//  NavTitle.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import SwiftUI

struct NavTitleView<Content: View>: View {
    @State private var scrollOffset = 0.0
    
    var title: String
    var profileImage: String
    var content: Content
    
    init(title: String, profileImage: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.profileImage = profileImage
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                ScrollOffsetBackground { offset in
                    self.scrollOffset = offset - proxy.safeAreaInsets.top
                }
                .frame(height: 0)
                
                /* Content */
                content
            }
            .padding(.top, 100)
            .ignoresSafeArea()
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 40)
            }
            .overlay {
                NavHeader(scrollOffset: scrollOffset, title: title, profileImage: profileImage)
            }
        }
    }
}

struct NavHeader: View {
    var scrollOffset: CGFloat
    var title: String
    var profileImage: String
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(height: interpolatedHeight())
                .background(.ultraThinMaterial.opacity(opastyview()))
                .blur(radius: 0.5)
                .edgesIgnoringSafeArea(.top)
            
            HStack {
                Image(systemName: "line.horizontal.3")
                    .foregroundStyle(.primary)
                    .frame(width: SideIcon(), height: SideIcon())
                    .font(.title)
                
                Spacer()
                
                Text(title)
                    .bold()
                    .font(.system(size: interpolatedOText()))
                    .offset(x: 10)
                
                Spacer()
                
                Image(systemName: profileImage)
                    .frame(width: ProImage(), height: ProImage())
                    .font(.title)
            }
            .offset(y: PushupOffset())
            .padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .animation(.easeIn, value: scrollOffset)
    }
    // Defines a function to calculate the height of an element based on the scroll offset.
    private func interpolatedHeight() -> CGFloat {
        // The starting height of the element before scrolling starts.
        let startHeight:CGFloat = 100
        // The ending height of the element after scrolling.
        let endHeight:CGFloat = 95
        // The amount of scroll required to transition from startHeight to endHeight.
        let transitionOffset :CGFloat = 35
        
        // Calculates the progress of the transition as a fraction between 0 and 1.
        // It uses the current scroll offset divided by the transitionOffset.
        // If the result is less than 0, it uses 0. If it's more than 1, it uses 1.
        let progress = min(max(scrollOffset / transitionOffset ,0 ) , 1)
        
        // Calculates the current height based on the progress.
        // If progress is 0, the height is startHeight. If progress is 1, the height is endHeight.
        // It interpolates between these two heights based on the progress.
        return  endHeight + (startHeight - endHeight) * progress
    }
    private func SideIcon() -> CGFloat {
        let theend: CGFloat = 20
        let thestart: CGFloat = 15
        let transitionOffset: CGFloat = 35
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return thestart + (theend - thestart) * progress
    }
    private func ProImage() -> CGFloat {
        let theend: CGFloat = 40
        let thestart: CGFloat = 30
        let transitionOffset: CGFloat = 35
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return thestart + (theend - thestart) * progress
    }
    
    private func PushupOffset() -> CGFloat {
        let theend: CGFloat = -40
        let thestart: CGFloat = -30
        let transitionOffset: CGFloat = 50
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return theend + (thestart - theend) * progress
    }
    private func interpolatedOText() -> CGFloat {
        let theendOffset: CGFloat = 20
        let thestartOffset: CGFloat = 25
        let transitionOffset: CGFloat = 50
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return theendOffset + (thestartOffset - theendOffset) * progress
    }
    private func opastyview() -> CGFloat {
        let startOffset: CGFloat = 0
        let endOffset: CGFloat = 1
        let transitionOffset: CGFloat = 50
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return endOffset + (startOffset - endOffset) * progress
    }
}

struct ScrollOffsetBackground: View {
    var onOffsetChange: (CGFloat) -> Void
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewOffsetKey.self , value: geometry.frame(in: .global).minY)
                .onPreferenceChange(ViewOffsetKey.self, perform: onOffsetChange)
            
        }
    }
}


struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
