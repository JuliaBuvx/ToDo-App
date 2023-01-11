//
//  GoalModel.swift
//  ToDoListPrBar
//
//  Created by Юлия Бубнова on 09.01.2023.
//

import Foundation


struct Goal: Identifiable, Codable {
    
    var id = UUID().uuidString
    var title: String
    var isDone: Bool
    
    func updateGoal() -> Goal {
        return Goal(id: id, title: title, isDone: !isDone)
    }
}
