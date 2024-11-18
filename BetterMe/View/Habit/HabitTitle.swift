//
//  HabitTitle.swift
//  BetterMe
//
//  Created by AudyDev on 13/11/24.
//

import SwiftUI

struct HabitTitle: View {
    let streak: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hola!")
                    .font(.title3)
                Text("¿Cómo te encuentra hoy?")
                    .font(.title3)
                    .bold()
            }
            Spacer()
            if streak > 0 {
                Image(systemName: "flame")
                    .resizable()
                    .frame(width: 20, height: 25)
                    .foregroundColor(.red.opacity(0.75))
                Text(String(streak))
                    .font(.title3)
                    .bold()
            }
        }.padding()
    }
}

#Preview {
    HabitTitle(streak: 33)
}
