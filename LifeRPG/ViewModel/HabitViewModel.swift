//
//  HabitViewModel.swift
//  LifeRPG
//
//  Created by zjucvglab509 on 2024/5/22.
//

import Foundation


@Observable class HabitViewModel: ObservableObject {
    var habits: [Habit] = []
    
    func example() {
        habits.append(Habit(name: "Example"))
    }
}
