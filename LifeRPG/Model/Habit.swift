//
//  Habit.swift
//  LifeRPG
//
//  Created by zjucvglab509 on 2024/5/22.
//

import Foundation
import SwiftData

@Model
final class Habit {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
