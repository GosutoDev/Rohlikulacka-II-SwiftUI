//
//  RoutesMockData.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation

struct MockData {
    static let days: [Day] = [
        Day(
            date: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date(),
            routes: [
                Route(time: Calendar.current.date(byAdding: .hour, value: 10, to: Date()) ?? Date(), orders: 16, tips: 230, region: "Prostejov"),
                Route(time: Calendar.current.date(byAdding: .hour, value: 5, to: Date()) ?? Date(), orders: 15, tips: 140),
                Route(time: Date(), orders: 5, tips: 150, region: "Humpolec")
            ]),
        
        Day(
            date: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date(),
            routes: [
                Route(time: Calendar.current.date(byAdding: .hour, value: 5, to: Date()) ?? Date(), orders: 9, tips: 90, region: "Svitavy"),
                Route(time: Date(), orders: 13, tips: 150)
            ]),
        
        Day(
            date: Date(),
            routes: [
                Route(time: Calendar.current.date(byAdding: .hour, value: 10, to: Date()) ?? Date(), orders: 9, tips: 90, region: "Svitavy"),
                Route(time: Calendar.current.date(byAdding: .hour, value: 5, to: Date()) ?? Date(), orders: 15, tips: 140, region: "Jihlava"),
                Route(time: Date(), orders: 13, tips: 150)
            ])
    ]
}
