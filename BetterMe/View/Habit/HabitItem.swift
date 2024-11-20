//
//  HabitItem.swift
//  BetterMe
//
//  Created by AudyDev on 14/11/24.
//

import SwiftUI

struct HabitItem: View {
    let habit: Habit
    
    @State var frequency: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: habit.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.vertical, 6)
                .padding(.trailing, 12)
                .foregroundColor(habit.color.toColor())
            VStack(alignment: .leading, spacing: 3) {
                Text(habit.name)
                    .font(.subheadline)
                Text("Objetivo: \(habit.goal) \(habit.mesure)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(frequency)
                .font(.footnote)
                .foregroundColor(.gray)
        }.padding(12)
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 0.75)
        )
        .frame(height: 50)
        .onAppear {
            frequency = habit.frequency.setFrequency()
        }
    }
}

#Preview {
    HabitItem(habit: Habit(
        name: "Beber agua",
        goal: 8,
        mesure: "vasos",
        descriptionText: "Beber es importante",
        icon: "pencil",
        color: "red",
        startDate: Date(),
        frequency: []
    ))
}
