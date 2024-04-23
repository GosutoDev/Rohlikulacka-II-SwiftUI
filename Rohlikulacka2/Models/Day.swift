//
//  Day.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation
import SwiftData

@Model
class Day: Equatable, Hashable {
    var day: Date
    @Relationship(deleteRule: .cascade) var routes: [Route]
    
    init(day: Date, routes: [Route]) {
        self.day = day
        self.routes = routes
    }
    
    var displayDate: String {
        let dayString = day.formatted(
            .dateTime
                .locale(Locale(identifier: "cs"))
                .weekday(.wide)
                .day(.defaultDigits)
                .month(.wide)
        )
            .capitalized
        return dayString
    }
    
    var ordersPerDay: Int {
        var orders = 0
        for route in routes {
            orders += Int(route.orders)
        }
        return orders
    }
    
    var earnPerDay: Int {
        var earn = 0
        for route in routes {
            earn += route.earnPerRoute
        }
        return earn
    }
}
