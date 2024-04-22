//
//  Month.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation

struct Month: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var days: [Day]
    var month: Date
    var variablePayRate: VariablePayRate
    
    var displayHomeMonth: String {
        let month = self.month.formatted(
            .dateTime
                .locale(Locale(identifier: "cs"))
                .month(.wide)
                .year(.defaultDigits))
            .capitalized
        return month
    }
    
    var displayInvoiceMonth: String {
        let month = self.month.formatted(
            .dateTime
                .locale(Locale(identifier: "cs"))
                .month(.twoDigits)
                .year(.defaultDigits))
            .capitalized
        return month
    }
    
    
    
    var ordersPerMonth: Int {
        var orders = 0
        for day in days {
            orders += day.ordersPerDay
        }
        return orders
    }
    
    var earnPerMonth: Int {
        var earn = 0
        for day in days {
            earn += day.earnPerDay
        }
        return earn
    }
    
    var workDays: Int {
        days.count
    }
}
