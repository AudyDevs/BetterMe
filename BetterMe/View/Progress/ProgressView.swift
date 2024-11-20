//
//  ProgressView.swift
//  BetterMe
//
//  Created by AudyDev on 18/11/24.
//

import SwiftUI
import SwiftData

struct ProgressView: View {
    @Environment(\.modelContext) var context
    @Query() var habits: [Habit]
    @Query() var historics: [Historic]
    
    @State var streak: Int = 0
    @State var currentProgress: Double = 0
    @State var goalProgress: Double = 0
    @State var showDetail: Bool = false
    @State var currentDate: Date = Date()
    @State var animatedValue: Double = 0
    @State var widthComponent: CGFloat = 0
    @State var filteredHistorics: [Historic] = []
    
    var body: some View {
        let progressPercentage = if goalProgress == 0 {
            0.0
        } else {
            currentProgress / goalProgress
        }
        
        VStack (alignment: .leading) {
            HabitTitle(streak: streak)
            DateTabView(
                currentDate: $currentDate
            )
            ProgressBar(
                progressPercentage: progressPercentage,
                animatedValue: $animatedValue,
                widthComponent: $widthComponent)
            HStack {
                Text("Hábitos de hoy")
                    .font(.title3)
                    .bold()
                Spacer()
                if currentDate > Date() || currentDate.isToday {
                    FloatingButton(action: {
                        withAnimation {
                            showDetail = true
                        }
                    })
                }
            }.padding(.top)
            .padding(.horizontal)
        
            List(filteredHistorics) { historic in
                HistoricItem(
                    historic: historic,
                    onTapGesture: { setProgress() },
                    onCompleteHabit: { checkStreak() }
                ).listRowSeparator(.hidden)
            }.listStyle(.plain)
            .overlay {
                if historics.isEmpty {
                    EmptyList()
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .transition(.move(edge: .leading))
        .fullScreenCover(isPresented: $showDetail) {
            AddDetailView(isSheet: true).transition(.move(edge: .trailing))
        }
        .onChange(of: currentDate) {
            saveHistorics()
        }
        .onAppear {
            saveHistorics()
            checkStreak()
        }
    }
}

extension ProgressView {
    func saveHistorics() {
        let filteredHabits = habits.filter { habit in
            let isValidInDate = habit.startDate.startOfDay() <= currentDate.startOfDay()
            let isValidInDay = habit.frequency.contains(currentDate.dayOfWeek())
            return isValidInDate && isValidInDay
        }
        for habit in filteredHabits {
            if !historics.contains(where: { $0.idHabit == habit.id && $0.dateHistoric.startOfDay() == currentDate.startOfDay() }) {
                let historicModel = Historic(
                    dateHistoric: currentDate,
                    idHabit: habit.id,
                    name: habit.name,
                    goal: habit.goal,
                    progress: 0,
                    mesure: habit.mesure,
                    icon: habit.icon,
                    color: habit.color
                )
                context.insert(historicModel)
            }
        }
        fetchHabitsFromHistorics()
    }
    
    func fetchHabitsFromHistorics() {
        let newHistorics = try? context.fetch(FetchDescriptor<Historic>())
        if let newHistorics = newHistorics {
            let filterHistorics = newHistorics.filter { $0.dateHistoric.startOfDay() == currentDate.startOfDay() }
            let sortHistorics = filterHistorics.sorted(by: { $0.name < $1.name } )
            filteredHistorics = sortHistorics
            setProgress()
        }
    }
    
    func setProgress() {
        var totalProgress: Double = 0
        var totalGoal: Double = 0
        if !filteredHistorics.isEmpty {
            for historic in filteredHistorics {
                totalProgress += Double(historic.progress)
                totalGoal += Double(historic.goal)
            }
        }
        currentProgress = totalProgress
        goalProgress = totalGoal
    }
    
    func checkStreak() {
        let newHistorics = try? context.fetch(FetchDescriptor<Historic>())
        if let newHistorics = newHistorics {
            
            var currentStreak = 0
            var breakStreak = false
            var index = 0
            
            while (!breakStreak) {
                let currentDate = Calendar.current.date(byAdding: .day, value: -index, to: Date()) ?? Date()
                let filterHistorics = newHistorics.filter { result in
                    result.dateHistoric.startOfDay() == currentDate.startOfDay() &&
                    result.progress == result.goal
                }
                if filterHistorics.count > 0 {
                    currentStreak += 1
                } else {
                    breakStreak = true
                }
                index += 1
            }
            streak = currentStreak
        }
    }
}
