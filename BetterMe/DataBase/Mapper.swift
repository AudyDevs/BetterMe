//
//  Mapper.swift
//  BetterMe
//
//  Created by AudyDev on 15/11/24.
//

import CoreData
import SwiftUI

extension HabitEntity {
    func toHabit() -> Habit {
        return Habit(
            id: self.id ?? UUID().uuidString,
            name: self.name ?? "",
            goal: Int(self.goal),
            progress: Int(self.progress),
            mesure: self.mesure ?? "",
            description: self.descriptionText ?? "",
            icon: self.icon ?? "",
            color: self.color ?? "",
            startDate: self.startDate ?? Date(),
            frequency: (self.frequency ?? [] as NSObject as! [String]) 
        )
    }
}

extension Habit {
    func toHabitEntity(context: NSManagedObjectContext) -> HabitEntity {
        let habitEntity = HabitEntity(context: context)
        
        habitEntity.id = self.id
        habitEntity.name = self.name
        habitEntity.goal = Int16(self.goal)
        habitEntity.progress = Int16(self.progress)
        habitEntity.mesure = self.mesure
        habitEntity.descriptionText = self.description
        habitEntity.icon = self.icon
        habitEntity.color = self.color
        habitEntity.startDate = self.startDate
        habitEntity.frequency = self.frequency as NSObject as? [String]
        
        return habitEntity
    }
}
