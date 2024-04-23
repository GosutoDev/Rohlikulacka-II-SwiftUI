//
//  RouteCellView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 16.04.2024.
//

import SwiftUI
import SwipeActions

struct RouteView: View {
    
    @Bindable var month: Month
    @Bindable var day: Day
    let route: Route
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        SwipeView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(route.displayTime)
                        Text(route.region ?? "Brno")
                    }
                    Spacer()
                    Image(.chevronRight)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .font(.footnote)
                .fontWeight(.semibold)
                
                Divider()
                
                RouteCellView(title: "Za zakazky", price: Int((route.orders ) * 30))
                
                Divider()
                
                RouteCellView(title: "Spropitne", price: Int(route.tips ))
                
                if route.region != "Brno" {
                    
                    Divider()
                    
                    RouteCellView(title: "Region", price: Int(route.regionPrice))
                    
                    if route.overtimeBonus == true {
                        
                        Divider()
                        
                        RouteCellView(title: "Nad ramec", price: Int(route.overtimeBonusPayRate))
                    }
                    
                }
                
                if route.blockBonus != BlockBonus.none {
                    
                    Divider()
                    
                    RouteCellView(title: "Bonus za blok", price: route.blockBonus?.getPayRate ?? 0)
                }
                
                VStack {
                    
                    Divider()
                    
                    HStack(spacing: 3) {
                        Image(.bagFill)
                            .imageScale(.medium)
                        Text("\(Int(route.orders))")
                        Spacer()
                        Text("\(route.earnPerRoute) Kc")
                            .foregroundStyle(.green)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .font(.title3)
                .fontWeight(.semibold)
                
                
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(.rect(cornerRadius: 8))
        } trailingActions: { _ in
            SwipeAction(systemImage: "trash", backgroundColor: .red) {
                withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                    deleteRoute(route)
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

extension RouteView {
    func deleteRoute(_ route: Route) {
        let dayRoutes = day.routes
        if !dayRoutes.isEmpty {
            if dayRoutes.contains(route), let index = dayRoutes.firstIndex(where: { $0.id == route.id }) {
                day.routes.remove(at: index)
                context.delete(route)
            }
        }
        let monthDays = month.days
        if dayRoutes.count == 1 {   
            if monthDays.contains(day), let index = monthDays.firstIndex(where: { $0.id == day.id }) {
                month.days.remove(at: index)
                context.delete(day)
                dismiss()
            }
        }
    }
}

#Preview {
    RouteView(month: MockData.months[0], day: MockData.days[1], route: MockData.days[0].routes[3])
}
