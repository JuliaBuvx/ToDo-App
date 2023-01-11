
//  GoalViewModel.swift
//  ToDoListPrBar


import Foundation



class GoalViewModel: ObservableObject {
    
    @Published var allGoals: [Goal] = [Goal(title: "Your first daily goal!", isDone: false)]
    
    var percent: CGFloat = 0.0
    
    func getGoals() {
        guard
        let data = UserDefaults.standard.data(forKey: "allGoals"),
        let savedGoals = try? JSONDecoder().decode([Goal].self, from: data)
        else { return }
        self.allGoals = savedGoals
    }
    
    func deleteGoal(index: IndexSet) {
        allGoals.remove(atOffsets: index)
        calculatePercent()
        saveGoals()
    }
    
    func moveGoal(from: IndexSet, to: Int ) {
        allGoals.move(fromOffsets: from, toOffset: to)
        saveGoals()
    }
    
    func addNewGoal(title: String, isDone: Bool = false) {
        let newGoal = Goal(title: title, isDone: isDone)
        allGoals.append(newGoal)
        calculatePercent()
        saveGoals()
    }
    
    func updateGoalState(item: Goal) {
        
        if let index = allGoals.firstIndex(where: { $0.id == item.id }) {
            allGoals[index] = item.updateGoal()
            
        }
        calculatePercent()
        saveGoals()

    }
    
    func calculatePercent() {
        
        let completedGoals = allGoals.filter { goal in
            return goal.isDone == true
        }.count
        
        let total = CGFloat(allGoals.count)
       percent = CGFloat(completedGoals) / total
    }
    
    func saveGoals() {
        if let encodedData = try? JSONEncoder().encode(allGoals) {
            UserDefaults.standard.set(encodedData, forKey: "allGoals")
        }
    }
}
