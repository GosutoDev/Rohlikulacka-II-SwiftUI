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

enum PayRate: Int, CaseIterable, Equatable {
    case A = 7
    case B = 5
    case C = 3
    case D = 0
}

// how many days
enum Attendance: Double, CaseIterable, Equatable, Hashable {
    case fullSixteen = 7
    case fullTen = 5
    case sixteenMinusOne = 3.5
    case tenMinusOne = 2.5
    case twoBlockUndelivered = 0
    
    var displayString: String {
        switch self {
        case .fullSixteen:
            return "Dodrzena garance 16"
        case .fullTen:
            return "Dodrzena garance 10"
        case .sixteenMinusOne:
            return "16 - 1"
        case .tenMinusOne:
            return "10 - 1"
        case .twoBlockUndelivered:
            return "-2 dny"
        }
    }
}

struct VariablePayRate: Equatable, Hashable {
    var delay: Int = PayRate.A.rawValue
    var review: Int = PayRate.A.rawValue
    var drivingStyle: Int = PayRate.A.rawValue
    var attendance: Double = Attendance.fullSixteen.rawValue
}

