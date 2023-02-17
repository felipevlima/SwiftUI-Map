//
//  SideBarStack.swift
//  SwiftUITeste
//
//  Created by Felipe Vieira Lima on 17/02/23.
//

import SwiftUI

struct SideBarStack<SidebarContent: View, Content: View>: View {
    let sidebarContent: SidebarContent
    let mainContent: Content
    let sidebarWidth: CGFloat
    @Binding var showSidebar: Bool
    
    init(sidebarWidth: CGFloat, showSidebar: Binding<Bool>, @ViewBuilder sidebar: () -> SidebarContent, @ViewBuilder content: () -> Content) {
        self.sidebarWidth = sidebarWidth
        self._showSidebar = showSidebar
        sidebarContent = sidebar()
        mainContent = content()
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            sidebarContent
                .frame(width: sidebarWidth, alignment: .center)
                .offset(x: 1, y: 0)
//                .animation(Animation.easeInOut.speed(2))
            mainContent
                .overlay(
                    Group{
                        if showSidebar {
                            Color.white
                                .opacity(showSidebar ? 0.01 : 0)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        self.showSidebar = false
                                    }
                                }
                        } else {
                            Color.clear
                                .opacity(showSidebar ? 0 : 0)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        self.showSidebar = false
                                    }
                                }
                        }
                    }
                )
                .offset(x: showSidebar ? sidebarWidth : 0, y: 0)
//                .animation(Animation.easeInOut.speed(2))
                           
        }
    }
}
