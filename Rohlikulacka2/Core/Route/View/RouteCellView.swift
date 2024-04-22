//
//  RouteCellView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 16.04.2024.
//

import SwiftUI

struct RouteCellView: View {
    
    let title: String
    let price: Int
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(title)
            Spacer()
            Text("\(price) Kc")
        }
        .font(.footnote)
        .fontWeight(.semibold)
    }
}

#Preview {
    RouteCellView(title: "blabla", price: 13)
}
