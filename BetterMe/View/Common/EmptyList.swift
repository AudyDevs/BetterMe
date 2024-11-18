//
//  EmptyList.swift
//  BetterMe
//
//  Created by AudyDev on 15/11/24.
//

import SwiftUI

struct EmptyList: View {
    var body: some View {
        VStack {
            Image(systemName: "figure.yoga")
                .resizable()
                .foregroundStyle(.red.opacity(0.75))
                .frame(width: 80, height: 80)
                .padding(.bottom, 8)
                .shadow(color: .red.opacity(0.75), radius: 8)
            Text("No tienes ningún hábito para hoy, crea los que necesites pulsando '+'")
                .font(.callout)
                .foregroundColor(.gray)
                .bold()
                .multilineTextAlignment(.center)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(76)
        .padding(.bottom, 16)
    }
}
