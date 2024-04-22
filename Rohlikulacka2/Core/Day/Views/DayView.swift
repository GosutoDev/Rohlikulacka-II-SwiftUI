//
//  HomeListCellView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI
import SwipeActions

struct DayView: View {
    
    let day: Day
    
    var body: some View {
        SwipeView {
            VStack(alignment: .leading) {
                HStack {
                    Text(day.displayDate)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    Image(.chevronRight)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Divider()
                
                
                ForEach(day.routes) { route in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .top, spacing: 0) {
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
                        Image(.bagFill)
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
        } trailingActions: { _ in
            SwipeAction(systemImage: "trash", backgroundColor: .red) {
                withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.spring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                        
                    }
                }
            }
            .allowSwipeToTrigger()
            .font(.title3.weight(.medium))
            .foregroundColor(.white)
        }
        .swipeActionCornerRadius(8)
        .swipeActionsMaskCornerRadius(8)
        .transition(.swipeDelete)
    }
}

#Preview {
    DayView(day: MockData.days[1])
}

