//
//  HomeListCellView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct HomeListCellView: View {
    
    let day: Day
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(day.displayDate)
                .font(.headline)
                .foregroundStyle(.primary)
            
            Divider()
            
            ForEach(day.routes) { route in
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 0) {
                        Text(route.displayTime)
                        Text(" - ")
                        Text(route.region ?? "Brno")
                        Spacer()
                        Text("\(route.earnPerRoute) Kc")
                    }
                    .font(.footnote)
                    .fontWeight(.semibold)
                    
                    
                    Divider()
                
                }
                .padding(.vertical, 2)
            }
            
            HStack {
                HStack(spacing: 3) {
                    Image(systemName: "bag.fill")
                        .font(.headline)
                    Text("\(day.ordersPerDay)")
                }
                
                Text("\(day.earnPerDay) Kc")
                    .foregroundStyle(.green)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.primary)
            
            
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 2)
    }
}

#Preview {
    HomeListCellView(day: MockData.days[1])
}
