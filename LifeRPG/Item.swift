//
//  Item.swift
//  LifeRPG
//
//  Created by zjucvglab509 on 2024/5/21.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
