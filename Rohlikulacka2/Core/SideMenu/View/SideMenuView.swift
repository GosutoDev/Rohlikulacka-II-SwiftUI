//
//  SideMenuView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var navPath: NavigationPath
    @Binding var showSideMenu: Bool
    
    var body: some View {
      
            ScrollView {
                Button("Prehled sluzeb") {
                    showSideMenu.toggle()
                    navPath.append(MockData.months[0])
                }

            }
                
        
        
        
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//#Preview {
//    SideMenuView(navPath: .constant("hello")
//}


