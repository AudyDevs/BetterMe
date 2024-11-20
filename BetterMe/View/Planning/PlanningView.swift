//
//  PlanningView.swift
//  BetterMe
//
//  Created by AudyDev on 13/11/24.
//

import SwiftUI
import SwiftData

struct PlanningView: View {
    @Query() var habits: [Habit]
    @Query() var historics: [Historic]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(habits) { habit in
                    PlanningItem(habit: habit, historics: historics.filter { $0.idHabit == habit.id })
                        .listRowSeparator(.hidden)
                }.listStyle(.plain)
                .overlay {
                    if habits.isEmpty {
                        EmptyList()
                    }
                }
            }
            .navigationTitle("Planificación Semanal")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}
