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
            TabItem(title: "Habitos", icon: "medal.fill") {
                HabitView()
            }
            TabItem(title: "Semanal", icon: "calendar") {
                PlanningView()
            }
            TabItem(title: "Estadisticas", icon: "chart.xyaxis.line") {
                StatisticsView()
            }
        }
    }
}

#Preview {
    HomeView()
}
