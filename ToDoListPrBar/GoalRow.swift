//
//  GoalRow.swift
//  ToDoListPrBar
//
//  Created by Юлия Бубнова on 09.01.2023.
//

import Foundation
import SwiftUI

struct GoalRow: View {
    var goal: Goal
    var body: some View {
        HStack {
            Image(systemName: goal.isDone ? "checkmark.circle" : "circle")
            Text(goal.title)
        }
    }
}
