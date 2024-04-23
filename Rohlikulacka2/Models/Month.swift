//
//  Month.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation
import SwiftData

@Model
class Month: Hashable {
    @Relationship(deleteRule: .cascade) var days: [Day]
    var month: Date
    @Transient var variablePayRate = VariablePayRate()
    
    init(days: [Day], month: Date) {
        self.days = days
        self.month = month
    }
    
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
        return days.count
    }
}
