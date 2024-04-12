//
//  Day.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation

struct Day: Identifiable {
    var id: String = UUID().uuidString
    var date: Date
    var routes: [Route]
    
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: "cs")
        return dateFormatter.string(from: self.date)
    }
    
    var ordersPerDay: Int {
        var orders = 0
        for route in self.routes {
            orders += route.orders
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
