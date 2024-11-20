//
//  FrequencySelector.swift
//  BetterMe
//
//  Created by AudyDev on 16/11/24.
//

import SwiftUI

struct FrequencySelector: View {
    let title: String
    @Binding var frequency: [String]
    @State var days: [DayFrequency] = [
        DayFrequency(name: "Lun"),
        DayFrequency(name: "Mar"),
        DayFrequency(name: "Mié"),
        DayFrequency(name: "Jue"),
        DayFrequency(name: "Vie"),
        DayFrequency(name: "Sáb"),
        DayFrequency(name: "Dom")]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 20))
                .bold()
            HStack {
                Spacer()
                ForEach(days.indices, id: \.self) { index in
                    VStack {
                        Text(days[index].name)
                            .font(.callout)
                            .fontWeight(.medium)
                            .textScale(.secondary)
                            .foregroundColor(.gray)
                        Image(systemName: days[index].selected ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(days[index].selected ? .red.opacity(0.75) : .gray)
                            .onTapGesture {
                                days[index].selected.toggle()
                                calculateSelectedDays()
                            }
                    }
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
            .onAppear {
                initDaysSelection()
            }
            .onChange(of: frequency) {
                initDaysSelection()
            }
        }
    }
}

extension FrequencySelector {
    func initDaysSelection() {
        for index in days.indices {
            days[index].selected = frequency.contains(days[index].name)
        }
    }
    
    func calculateSelectedDays() {
        var selectedDays: [String] = []
        for day in days {
            if day.selected {
                selectedDays.append(day.name)
            }
        }
        frequency = selectedDays
    }
}
