//
//  PlanningItem.swift
//  BetterMe
//
//  Created by AudyDev on 19/11/24.
//

import SwiftUI

struct PlanningItem: View {
    let habit: Habit
    let historics: [Historic]
    
    var body: some View {
        let frequency = habit.frequency.setFrequency()
        
        VStack {
            HStack {
                Image(systemName: habit.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.vertical, 6)
                    .padding(.trailing, 6)
                    .foregroundColor(habit.color.toColor())
                Text(habit.name)
                    .font(.callout)
                    .bold()
                Spacer()
                Text(frequency)
                    .font(.callout)
                    .fontWeight(.medium)
                    .textScale(.secondary)
                    .foregroundColor(.gray)
            }.padding(.horizontal)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .foregroundColor(.gray.opacity(0.75))
                .padding(.horizontal)
                .padding(.bottom, 6)
            HStack {
                Spacer()
                ForEach((0...6).reversed(), id: \.self) { i in
                    let date = Calendar.current.date(byAdding: .day, value: -i, to: Date()) ?? Date()
                    let filteredHistorics = historics.filter { $0.dateHistoric.startOfDay() == date.startOfDay() }
                    let completed: Bool = (filteredHistorics.first?.progress ?? 0 == filteredHistorics.first?.goal ?? 0) && (filteredHistorics.first?.goal ?? 0 > 0)
                    
                    VStack {
                        Text(date.dayOfWeek())
                            .font(.callout)
                            .fontWeight(.medium)
                            .textScale(.secondary)
                            .foregroundColor(.gray)
                        Image(systemName: completed ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(completed ? habit.color.toColor() : .gray)
                    }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(.gray.opacity(0.2))
        .cornerRadius(16)
    }
}
