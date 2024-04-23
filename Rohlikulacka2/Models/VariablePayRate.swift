//
//  VariablePayRate.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 22.04.2024.
//

import Foundation
import SwiftData

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

@Model
class VariablePayRate: Equatable, Hashable {
    var delay: Int = PayRate.A.rawValue
    var review: Int = PayRate.A.rawValue
    var drivingStyle: Int = PayRate.A.rawValue
    var attendance: Double = Attendance.fullSixteen.rawValue
    
    init(
        delay: Int = PayRate.A.rawValue,
        review: Int = PayRate.A.rawValue,
        drivingStyle: Int = PayRate.A.rawValue,
        attendance: Double = Attendance.fullSixteen.rawValue) {
            self.delay = delay
            self.review = review
            self.drivingStyle = drivingStyle
            self.attendance = attendance
        }
}
