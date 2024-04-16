//
//  BackButtonView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 15.04.2024.
//

import SwiftUI

struct BackButtonView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Image(.chevronLeft)
                    .imageScale(.medium)
                Text("Zpět")
            }
            .fontWeight(.semibold)
            .tint(.primary)
        }
    }
}

#Preview {
    BackButtonView()
}
