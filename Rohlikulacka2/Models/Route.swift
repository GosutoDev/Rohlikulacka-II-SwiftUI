//
//  Route.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation
import SwiftData

enum BlockBonus: String, CaseIterable, Codable {
    case none = "Zadny"
    case oneRoute = "1 kolo"
    case twoRoute = "2 kola"
    
    var getPayRate: Int {
        switch self {
        case .none:
            0
        case .oneRoute:
            150
        case .twoRoute:
            300
        }
    }
}

@Model
class Route: Equatable, Hashable {
    var date: Date
    var orders: Int
    var tips: Int
    var region: String?
    var overtimeBonus: Bool?
    var blockBonus: BlockBonus?

    init(date: Date, orders: Int, tips: Int, region: String? = nil, overtimeBonus: Bool? = nil, blockBonus: BlockBonus? = nil) {
        self.date = date
        self.orders = orders
        self.tips = tips
        self.region = region
        self.overtimeBonus = overtimeBonus
        self.blockBonus = blockBonus
    }
    
    var displayTime: String {
        let time = date.formatted(
            .dateTime
                .hour(.defaultDigits(amPM: .wide))
                .minute(.defaultDigits)
        )
        return time
    }
    
    var overtimeBonusPayRate: Int {
        guard let overtimeBonus = overtimeBonus else { return 0 }
        guard overtimeBonus else { return 0 }
        return 250
    }
    
    var regionPrice: Int {
        return 300
    }
    
    // mock still
    var earnPerRoute: Int {
        return (self.orders ) * 60
    }
}

