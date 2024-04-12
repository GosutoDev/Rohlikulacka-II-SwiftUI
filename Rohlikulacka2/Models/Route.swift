//
//  Route.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation

struct Route: Identifiable {
    var id: String = UUID().uuidString
    var time: Date
    var orders: Int
    var tips: Int
    var region: String?
    var bonus: Int?
    
    var displayTime: String {
        let time = time.formatted(
            .dateTime
                .hour(.defaultDigits(amPM: .wide))
                .minute(.defaultDigits)
        )
        return time
    }
    
    // mock still
    var earnPerRoute: Int {
        return self.orders * 60
    }
}
