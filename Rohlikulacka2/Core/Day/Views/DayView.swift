//
//  HomeListCellView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI
import SwipeActions
import SwiftData

struct DayView: View {
    
    let day: Day
    let month: Month
    
    @Environment(\.modelContext) private var context
    
    @State private var showing = true
    
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
            
            .onAppear {
                print(day.routes.count)
            }
            
        } trailingActions: { _ in
            SwipeAction(systemImage: "trash", backgroundColor: .red) {
                withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                    deleteDay(day)
                    //                        showing.toggle()
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

extension DayView {
    func deleteDay(_ day: Day) {
        let monthDays = month.days
        if !monthDays.isEmpty {
            if monthDays.contains(day), let index = monthDays.firstIndex(where: { $0.id == day.id }) {
                month.days.remove(at: index)
                context.delete(day)
            }
        }
        
    }
}

#Preview {
    DayView(day: MockData.days[1], month: MockData.months[0])
}


