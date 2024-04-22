//
//  ListDaysView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 22.04.2024.
//

import SwiftUI

struct ListDaysView: View {
    
    @Binding var showSheet: Bool
    
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            
            HStack {
                Text("Odvezené trasy")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Pridat trasu")
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(.green)
                        .clipShape(.rect(cornerRadius: 8))
                }
                
            }
            .padding(.horizontal)
            
            ForEach(MockData.days) { day in
                NavigationLink {
                    DayDetailView(day: day)
                } label: {
                    DayView(day: day)
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
                .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    ScrollView {
        ListDaysView(showSheet: .constant(false))
    }
}
