//
//  ContentView.swift
//  ToDoListPrBar


import SwiftUI

struct ContentView: View {
    @ObservedObject var goalViewModel: GoalViewModel = GoalViewModel()
    var body: some View {
        
        
        NavigationView {
            VStack {
                List {
                        ForEach(goalViewModel.allGoals) { goal in
                            
                            GoalRow(goal: goal)
                                .onTapGesture {
                                    goalViewModel.updateGoalState(item: goal)
                                }
                        }
                        .onDelete(perform: goalViewModel.deleteGoal)
                        .onMove(perform: goalViewModel.moveGoal)
                        
                        
                        ProgressBarView(percent: goalViewModel.percent)
                    
                        
                        NavigationLink(destination: AddNewGoalView( onSave: { title in  goalViewModel.addNewGoal(title: title)}
                                                                  ), label: {
                            
                            Text("Add new goal").foregroundColor(.blue).bold()
                            
                        })
                    }
                    .navigationTitle("ToDo List")
                    .toolbar {
                        EditButton()
                    }
                    
                }
            }
        }
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
