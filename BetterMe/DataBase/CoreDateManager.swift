//
//  CoreDateManager.swift
//  BetterMe
//
//  Created by AudyDev on 15/11/24.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Habit")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
}
