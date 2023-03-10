
//  GoalRow.swift
//  ToDoListPrBar


import Foundation
import SwiftUI


// Struct for List row in ContentView 
struct GoalRow: View {
    var goal: Goal
    var body: some View {
        HStack {
            Image(systemName: goal.isDone ? "checkmark.circle" : "circle")
            Text(goal.title)
        }
    }
}
