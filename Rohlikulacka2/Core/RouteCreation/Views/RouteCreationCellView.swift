//
//  RouteCreationCellVIew.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct RouteCreationCellView<T: Hashable>: View {
    
    @Binding var selection: T
    let title: String
    let data: [T]
    
    // Need for one specific menu and always there be array that count 201
    var insertCrown: String {
        guard data.count == 201 else { return "" }
        return " Kc"
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Menu {
                Picker("", selection: $selection) {
                    ForEach(data, id: \.self) { data in
                        Text("\(data)\(insertCrown)")
                    }
                }
            } label: {
                Text("\(selection)\(insertCrown)")
                    .tint(.primary)
                    .frame(width: 100)
                    .padding(10)
                    .background(Color(.systemGray5))
                    .clipShape(.rect(cornerRadius: 8))
            }
        }
        
        .padding(.vertical)
    }
}

#Preview {
    RouteCreationCellView(selection: .constant(1), title: "Ahoj", data: [1,2])
}

