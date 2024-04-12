//
//  SideMenuView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .ignoresSafeArea()
            
            Spacer()
        }
        .background(.clear)
        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
    }
}

#Preview {
    SideMenuView()
}
