//
//  BetterMeApp.swift
//  BetterMe
//
//  Created by AudyDev on 13/11/24.
//

import SwiftUI
import SwiftData

@main
struct BetterMeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: [Habit.self, Historic.self])
    }
}
