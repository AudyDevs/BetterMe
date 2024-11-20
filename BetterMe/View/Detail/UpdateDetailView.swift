//
//  UpdateDetailView.swift
//  BetterMe
//
//  Created by AudyDev on 18/11/24.
//

import SwiftUI
import SwiftData
    
struct UpdateDetailView: View {
    @Bindable var habit: Habit
    
    var body: some View {
        DetailBody(
            isAddingNew: false,
            isSheet: false,
            name: $habit.name,
            goal: $habit.goal,
            mesure: $habit.mesure,
            description: $habit.descriptionText,
            frequency: $habit.frequency,
            selectedIcon: $habit.icon,
            selectedColor: $habit.color,
            startDate: $habit.startDate,
            currentHabit: Binding<Habit?>(
                get: { habit },
                set: { _ in }
            )
        )
    }
}

