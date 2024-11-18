//
//  DateTabView.swift
//  BetterMe
//
//  Created by AudyDev on 14/11/24.
//

import SwiftUI

struct DateTabView: View {
    @State private var daySlider: [Date] = []
    @Binding var currentDate: Date
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(daySlider, id: \.self) { day in
                        DayItem(
                            date: day,
                            currentDate: $currentDate
                        ).id(day)
                    }
                }
                .padding(.horizontal)
            }
            .onAppear() {
                if daySlider.isEmpty {
                    daySlider.append(contentsOf: Date().fetchDays())
                }
            }
            .onChange(of: daySlider) {
                if let targetDate = daySlider.first(where: { $0.isSameDate(comparedDate: currentDate) }) {
                    withAnimation {
                        proxy.scrollTo(targetDate, anchor: .center)
                    }
                }
            }.onChange(of: currentDate) {
                if let targetDate = daySlider.first(where: { $0.isSameDate(comparedDate: currentDate) }) {
                    withAnimation {
                        proxy.scrollTo(targetDate, anchor: .center)
                    }
                }
            }
        }
    }
}
