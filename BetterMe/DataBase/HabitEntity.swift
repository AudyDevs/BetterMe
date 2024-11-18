//
//  HabitEntity.swift
//  BetterMe
//
//  Created by AudyDev on 14/11/24.
//

import CoreData
import SwiftUI

@objc(HabitEntity)
public class HabitEntity: NSManagedObject {
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var goal: Int16
    @NSManaged public var progress: Int16
    @NSManaged public var mesure: String?
    @NSManaged public var descriptionText: String?
    @NSManaged public var icon: String?
    @NSManaged public var color: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var frequency: [String]?
}
