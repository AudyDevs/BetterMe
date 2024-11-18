//
//  HomeView.swift
//  BetterMe
//
//  Created by AudyDev on 13/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TabItem(title: "Hábitos", icon: "medal.fill") {
                HabitView()
            }
            TabItem(title: "Semanal", icon: "calendar") {
                PlanningView()
            }
            TabItem(title: "Estadísticas", icon: "chart.xyaxis.line") {
                StatisticsView()
            }
        }
        .accentColor(.red.opacity(0.75))
    }
}

#Preview {
    HomeView()
}
