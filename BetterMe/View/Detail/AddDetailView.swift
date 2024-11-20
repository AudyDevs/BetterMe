//
//  AddDetailView.swift
//  BetterMe
//
//  Created by AudyDev on 18/11/24.
//

import SwiftUI
import SwiftData
    
struct AddDetailView: View {
    let isSheet: Bool
    @State var name: String = ""
    @State var goal: Int = 0
    @State var mesure: String = ""
    @State var description: String = ""
    @State var frequency: [String] = ["Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"]
    @State var selectedIcon: String = "waterbottle.fill"
    @State var selectedColor: String = "black"
    @State var startDate: Date = Date()
    
    var body: some View {
        DetailBody(
            isAddingNew: true,
            isSheet: isSheet,
            name: $name,
            goal: $goal,
            mesure: $mesure,
            description: $description,
            frequency: $frequency,
            selectedIcon: $selectedIcon,
            selectedColor: $selectedColor,
            startDate: $startDate,
            currentHabit: .constant(nil)
        )
    }
}

