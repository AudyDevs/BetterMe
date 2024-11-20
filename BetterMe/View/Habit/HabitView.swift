//
//  HabitView.swift
//  BetterMe
//
//  Created by AudyDev on 13/11/24.
//

import SwiftUI
import SwiftData

struct HabitView: View {
    @Query() var habits: [Habit]
    
    var body: some View {
        NavigationStack {
            VStack () {
                List(habits) { habit in
                    ZStack {
                        HabitItem(habit: habit)
                        NavigationLink(destination: { UpdateDetailView(habit: habit) }, label: {}).opacity(0)
                    }.listRowSeparator(.hidden)
                }.listStyle(.plain)
                    .overlay {
                        if habits.isEmpty {
                            EmptyList()
                        }
                    }
            }
            .navigationTitle("Mis hábitos")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    NavigationLink(destination: { AddDetailView(isSheet: false) }) {
                        Label("Añadir hábito", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    HabitView()
}
