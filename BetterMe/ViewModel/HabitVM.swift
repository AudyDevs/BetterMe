//
//  HabitVM.swift
//  BetterMe
//
//  Created by AudyDev on 15/11/24.
//

import Foundation

@Observable
final class HabitVM {
    var isLoading: Bool = false
    var habits: [Habit] = []
    
    let context = CoreDataManager.shared.context
    
    func getHabits() {
        self.isLoading = true
        self.habits = HabitEntity.getAllHabits(context: context).map { $0.toHabit() }
        self.isLoading = false
    }
    
    func getHabitById(idHabit: String) {
        self.isLoading = true
        self.habits.removeAll()
        self.habits.append(HabitEntity.getById(id: idHabit, context: context).map { $0.toHabit() }!)
        self.isLoading = false
    }
    
    func addHabit(habit: Habit) {
        let entity = habit.toHabitEntity(context: context)
        HabitEntity.save(habit: entity, context: context)
    }
    
    func updateHabit(entity: HabitEntity, habit: Habit) {
        entity.update(habit: habit, context: context)
    }
    
    func deleteHabit(idHabit: String) {
        HabitEntity.delete(idHabit: idHabit, context: context)
    }
    
    func convertToHabitEntity(habit: Habit) -> HabitEntity {
        return habit.toHabitEntity(context: context)
    }
}
