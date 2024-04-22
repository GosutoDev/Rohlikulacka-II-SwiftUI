//
//  Route.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import Foundation

/*
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
 */

//enum Regions: String, CaseIterable {
//    case one = "Brno"
//    case two
//    case three
//    
//    func getRegionString() -> String {
//        switch self {
//        case .one:
//            <#code#>
//        case .two:
//            <#code#>
//        case .three:
//            <#code#>
//        }
//    }
//}

struct Route: Identifiable, Equatable, Hashable {
    var id: String = UUID().uuidString
    var date: Date
    var orders: Int
    var tips: Int
    var region: String?
    var overtimeBonus: Bool?
    var blockBonus: Int?
    
//    var variableOrderPayRate: VariablePayRate
    
    var displayTime: String {
        let time = date.formatted(
            .dateTime
                .hour(.defaultDigits(amPM: .wide))
                .minute(.defaultDigits)
        )
        return time
    }
    
    var overtimeBonusPayRate: Int {
        guard let overtimeBonus = self.overtimeBonus else { return 0 }
        guard overtimeBonus else { return 0 }
        return 250
    }
    
    var regionPrice: Int {
        return 300
    }
    
    // mock still
    var earnPerRoute: Int {
        return self.orders * 60
    }
}

