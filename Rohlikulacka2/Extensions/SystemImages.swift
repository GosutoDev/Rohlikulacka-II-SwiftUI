//
//  SystemImages.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 15.04.2024.
//

import SwiftUI
import Foundation

enum Symbol: String {
    case bagFill = "bag.fill"
    case plus = "plus"
    case listBullet = "list.bullet"
    case creditcardFill = "creditcard.fill"
    case calendar = "calendar"
    case chevronLeft = "chevron.left"
    case chevronUp = "chevron.up"
    case chevronRight = "chevron.right"
    case chevronDown = "chevron.down"
    case variablePayRate = "dollarsign.arrow.circlepath"
}


extension Image {
    init?(_ name: Symbol) {
        self.init(systemName: name.rawValue)
    }
}
