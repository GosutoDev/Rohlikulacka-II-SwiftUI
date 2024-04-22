//
//  RoutesMockData.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation

struct MockData {
    static var days: [Day] = [
        Day(
            day: setDateDay(plus: 3),
            routes: [
                Route(
                    date: setDateHour(plus: 6),
                    orders: 10,
                    tips: 10,
                    region: "Brno",
                    blockBonus: 150),
                Route(
                    date: setDateHour(plus: 4),
                    orders: 16,
                    tips: 230,
                    region: "Jihlava, Humpolec, Třebíč, Telč, Havlíčkův Brod"),
                Route(
                    date: setDateHour(plus: 2),
                    orders: 13,
                    tips: 50,
                    region: "Uherské Hradiště, Uherský Brod",
                    blockBonus: 300),
                Route(
                    date: Date(),
                    orders: 12,
                    tips: 70,
                    region: "Prostějov, Haňovice, Troubky",
                    overtimeBonus: true,
                    blockBonus: 150)
            ]),
        
        Day(
            day: setDateDay(plus: 2),
            routes: [
                Route(
                    date: setDateHour(plus: 4),
                    orders: 16,
                    tips: 230,
                    region: "Prostejov"),
                Route(
                    date: setDateHour(plus: 2),
                    orders: 15,
                    tips: 140),
                Route(
                    date: Date(),
                    orders: 5,
                    tips: 150,
                    region: "Humpolec")
            ]),
        
        Day(
            day: setDateDay(plus: 1),
            routes: [
                Route(
                    date: setDateHour(plus: 2),
                    orders: 9,
                    tips: 90,
                    region: "Svitavy"),
                Route(
                    date: Date(),
                    orders: 13,
                    tips: 150)
            ]),
        
        Day(
            day: Date(),
            routes: [
                Route(
                    date: setDateHour(plus: 4),
                    orders: 9,
                    tips: 90,
                    region: "Svitavy"),
                Route(
                    date: setDateHour(plus: 2),
                    orders: 15,
                    tips: 140,
                    region: "Jihlava"),
                Route(
                    date: Date(),
                    orders: 13,
                    tips: 150)
            ])
    ]
    
    static let variablePayRate = VariablePayRate()
    
    static let months: [Month] = [
        Month(days: days, month: Date(), variablePayRate: variablePayRate)
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

extension MockData {
    static func setDateHour(plus hour: Int) -> Date {
        return Calendar.current.date(byAdding: .hour, value: hour, to: Date()) ?? Date()
    }
    
    static func setDateDay(plus day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: Date()) ?? Date()
    }
}
