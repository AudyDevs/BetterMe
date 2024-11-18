//
//  Repository.swift
//  BetterMe
//
//  Created by AudyDev on 15/11/24.
//

import CoreData

extension HabitEntity {
    
    static func habitFetchRequest() -> NSFetchRequest<HabitEntity>{
        return NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
    }
    
    static func getAllHabits(context: NSManagedObjectContext) -> [HabitEntity] {
        let fetchRequest: NSFetchRequest<HabitEntity> = HabitEntity.habitFetchRequest()
        
        do {
            let habits = try context.fetch(fetchRequest)
            print(habits)
            return habits
        } catch {
            print("Error fetching habits: \(error.localizedDescription)")
            return []
        }
    }
    
    static func getById(id: String, context: NSManagedObjectContext) -> HabitEntity? {
        let fetchRequest: NSFetchRequest<HabitEntity> = HabitEntity.habitFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let habit = try context.fetch(fetchRequest)
            return habit.first
        } catch {
            print("Error fetching habit by id: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func save(habit: HabitEntity, context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("Error saving habit: \(error.localizedDescription)")
        }
    }
    
    func update(habit: Habit, context: NSManagedObjectContext) {
        if self.name != habit.name {
            self.name = habit.name
        }
        if self.goal != Int16(habit.goal) {
            self.goal = Int16(habit.goal)
        }
        if self.progress != Int16(habit.progress) {
            self.progress = Int16(habit.progress)
        }
        if self.mesure != habit.mesure {
            self.mesure = habit.mesure
        }
        if self.descriptionText != habit.description {
            self.descriptionText = habit.description
        }
        if self.icon != habit.icon {
            self.icon = habit.icon
        }
        if self.color != habit.color {
            self.color = habit.color
        }
        if self.startDate != habit.startDate {
            self.startDate = habit.startDate
        }
        if self.frequency! != habit.frequency {
            self.frequency = habit.frequency as NSObject as? [String]
        }
        
        do {
            try context.save()
        } catch {
            print("Error updating habit: \(error.localizedDescription)")
        }
    }
    
    static func delete(idHabit: String, context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<HabitEntity> = HabitEntity.habitFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", idHabit)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let habitToDelete = results.first {
                context.delete(habitToDelete)
                try context.save()
            } else {
                print("No habit found with id: \(idHabit).")
            }
        } catch {
            print("Error deleting habit: \(error.localizedDescription)")
        }
    }
}
