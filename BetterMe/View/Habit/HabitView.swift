//
//  HabitView.swift
//  BetterMe
//
//  Created by AudyDev on 13/11/24.
//

import SwiftUI

struct HabitView: View {
    
    @State var habitViewModel = HabitVM()
    
    let streak: Int = 30
    
    @State var idHabit: String = ""
    @State var showDetail: Bool = false
    @State var currentProgress: Double = 55
    @State var goalProgress: Double = 100
    @State var currentDate: Date = Date()
    @State var animatedValue: Double = 0
    @State var widthComponent: CGFloat = 0
    
    var body: some View {
        if showDetail {
            DetailView(showDetail: $showDetail, idHabit: idHabit)
                .transition(.move(edge: .trailing))
        } else {
            let progressPercentage = currentProgress / goalProgress
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
                    FloatingButton(action: {
                        withAnimation {
                            showDetail = true
                        }
                    })
                }.padding(.top)
                .padding(.horizontal)
                
                if habitViewModel.habits.isEmpty {
                    EmptyList()
                } else {
                    if habitViewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.25)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        List(habitViewModel.habits) { habit in
                            HabitItem(habit: habit)
                                .listRowSeparator(.hidden)
                                .onTapGesture {
                                    idHabit = habit.id
                                    withAnimation {
                                        showDetail = true
                                    }
                                }
                        }.listStyle(.plain)
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .transition(.move(edge: .leading))
            .onAppear {
                habitViewModel.getHabits()
            }
        }
    }
}

#Preview {
    HabitView()
}
