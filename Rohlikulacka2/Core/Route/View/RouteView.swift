//
//  RouteCellView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 16.04.2024.
//

import SwiftUI
import SwipeActions

struct RouteView: View {
    
    let route: Route
    @Binding var delete: Bool
    
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
                
                RouteCellView(title: "Za zakazky", price: Int(route.orders * 30))
                
                Divider()
                
                RouteCellView(title: "Spropitne", price: Int(route.tips))
                
                if route.region ?? "Brno" != "Brno" {
                    
                    Divider()
                    
                    RouteCellView(title: "Region", price: Int(route.regionPrice))
                    
                    if route.overtimeBonus ?? false == true {
                        
                        Divider()
                        
                        RouteCellView(title: "Nad ramec", price: Int(route.overtimeBonusPayRate))
                    }
                    
                }
                
                if route.blockBonus ?? 0 != 0 {
                    
                    Divider()
                    
                    RouteCellView(title: "Bonus za blok", price: Int(route.blockBonus ?? 0))
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
                    delete = false
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.spring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                        delete = true
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
    RouteView(route: MockData.days[0].routes[3], delete: .constant(true))
}
