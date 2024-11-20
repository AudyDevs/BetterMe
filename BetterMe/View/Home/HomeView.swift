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
            TabItem(title: "Progreso", icon: "chart.xyaxis.line") {
                ProgressView()
            }
            TabItem(title: "Hábitos", icon: "medal.fill") {
                HabitView()
            }
            TabItem(title: "Semanal", icon: "calendar") {
                PlanningView()
            }
        }
        .accentColor(.red.opacity(0.75))
    }
}

#Preview {
    HomeView()
}
