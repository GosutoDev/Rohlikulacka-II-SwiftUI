//
//  ListDaysView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 22.04.2024.
//

import SwiftUI

struct ListDaysView: View {
    var body: some View {
        LazyVStack(alignment: .leading) {
            
            Text("Odvezené trasy")
                .font(.title2)
                .fontWeight(.bold)
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
        ListDaysView()
    }
}
