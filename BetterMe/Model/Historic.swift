//
//  Historic.swift
//  BetterMe
//
//  Created by AudyDev on 18/11/24.
//

import SwiftUI
import SwiftData

@Model
class Historic: Identifiable, Equatable {
    @Attribute(.unique) var id: String = UUID().uuidString
    var dateHistoric: Date
    var idHabit: String
    var name: String
    var goal: Int
    var progress: Int
    var mesure: String
    var icon: String
    var color: String

    init(
        dateHistoric: Date,
        idHabit: String,
        name: String,
        goal: Int,
        progress: Int,
        mesure: String,
        icon: String,
        color: String
    ) {
        self.dateHistoric = dateHistoric
        self.idHabit = idHabit
        self.name = name
        self.goal = goal
        self.progress = progress
        self.mesure = mesure
        self.icon = icon
        self.color = color
    }
}
