//
//  RoutesMockData.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation

struct MockData {
    static var days: [Day] = [
        Day(day: Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date(), routes: [
            Route(date: Calendar.current.date(byAdding: .hour, value: 15, to: Date()) ?? Date(), orders: 10, tips: 10, region: "Brno", blockBonus: 150),
            Route(date: Calendar.current.date(byAdding: .hour, value: 10, to: Date()) ?? Date(), orders: 16, tips: 230, region: "Jihlava, Humpolec, Třebíč, Telč, Havlíčkův Brod"),
            Route(date: Calendar.current.date(byAdding: .hour, value: 5, to: Date()) ?? Date(), orders: 13, tips: 50, region: "Uherské Hradiště, Uherský Brod", blockBonus: 300),
            Route(date: Date(), orders: 12, tips: 70, region: "Prostějov, Haňovice, Troubky", overtimeBonus: true, blockBonus: 150)
        ]),
        
        Day(
            day: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date(),
            routes: [
                Route(date: Calendar.current.date(byAdding: .hour, value: 10, to: Date()) ?? Date(), orders: 16, tips: 230, region: "Prostejov"),
                Route(date: Calendar.current.date(byAdding: .hour, value: 5, to: Date()) ?? Date(), orders: 15, tips: 140),
                Route(date: Date(), orders: 5, tips: 150, region: "Humpolec")
            ]),
        
        Day(
            day: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date(),
            routes: [
                Route(date: Calendar.current.date(byAdding: .hour, value: 5, to: Date()) ?? Date(), orders: 9, tips: 90, region: "Svitavy"),
                Route(date: Date(), orders: 13, tips: 150)
            ]),
        
        Day(
            day: Date(),
            routes: [
                Route(date: Calendar.current.date(byAdding: .hour, value: 10, to: Date()) ?? Date(), orders: 9, tips: 90, region: "Svitavy"),
                Route(date: Calendar.current.date(byAdding: .hour, value: 5, to: Date()) ?? Date(), orders: 15, tips: 140, region: "Jihlava"),
                Route(date: Date(), orders: 13, tips: 150)
            ])
    ]
    
    static let months: [Month] = [
        Month(days: MockData.days, month: Date())
    ]
    
    static let regions: [String] = [
        "Brno",
        "Uherské Hradiště, Uherský Brod",
        "Jihlava, Humpolec, Třebíč, Telč, Havlíčkův Brod",
        "Svitavy, Polička, Moravská Třebová, Mohelnice",
        "Břeclav, Hodonín, Mikulov, Valtice, Lanžhot",
        "Znojmo, Moravský Krumlov",
        "Prostějov, Haňovice, Troubky",
        "Staré Hutě, Zástřily, Roštín",
        "Žďár nad Sázavou, Velká Bíteš",
        "Kroměříž, Kojetín, Zdounky",
        "Česká Třebová, Lanškroun, Zábřeh",
        "Ivanovice na Hané"
    ]
    
    static let bonusPerBlock: [String] = [
        "Zadny",
        "za 1 kolo",
        "za 2 kola"
    ]
}
