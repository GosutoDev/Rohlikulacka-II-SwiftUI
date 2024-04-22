//
//  Day.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation

struct Day: Identifiable, Equatable, Hashable {
    var id: String = UUID().uuidString
    var day: Date
    var routes: [Route]
    
    var displayDate: String {
        let day = self.day.formatted(
            .dateTime
                .locale(Locale(identifier: "cs"))
                .weekday(.wide)
                .day(.defaultDigits)
                .month(.wide)
        )
            .capitalized
        return day
    }
    
    var ordersPerDay: Int {
        var orders = 0
        for route in self.routes {
            orders += Int(route.orders)
        }
        return orders
    }
    
    var earnPerDay: Int {
        var earn = 0
        for route in self.routes {
            earn += route.earnPerRoute
        }
        return earn
    }
}
