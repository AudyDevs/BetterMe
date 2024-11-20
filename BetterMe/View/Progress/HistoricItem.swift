//
//  HistoricItem.swift
//  BetterMe
//
//  Created by AudyDev on 18/11/24.
//

import SwiftUI

struct HistoricItem: View {
    @Bindable var historic: Historic
    let onTapGesture: () -> Void
    let onCompleteHabit: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: historic.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.vertical, 6)
                .padding(.trailing, 12)
                .foregroundColor(historic.color.toColor())
            VStack(alignment: .leading, spacing: 3) {
                Text(historic.name)
                    .font(.subheadline)
                Text("\(historic.progress)/\(historic.goal) \(historic.mesure)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            HistoricButtons(
                color: historic.color.toColor(),
                showButtons: historic.dateHistoric.isToday,
                showComplete: historic.progress == historic.goal,
                onMinusTap: {
                    MinusProgress()
                    onTapGesture()
                },
                onPlusTap: {
                    PlusProgress()
                    onTapGesture()
                }
            )
        }.padding(12)
        .padding(.leading, 10)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 0.75)
        )
        .frame(height: 50)
    }
}

extension HistoricItem {
    func MinusProgress() {
        if historic.progress > 0 {
            historic.progress -= 1
        }
    }
    
    func PlusProgress() {
        if historic.progress < historic.goal {
            historic.progress += 1
            if historic.progress == historic.goal {
                onCompleteHabit()
            }
        }
    }
}
