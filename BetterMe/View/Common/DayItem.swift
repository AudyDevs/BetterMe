//
//  DayItem.swift
//  BetterMe
//
//  Created by AudyDev on 14/11/24.
//

import SwiftUI

struct DayItem: View {
    let date: Date
    @Binding var currentDate: Date
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 6) {
            Text(date.dayOfWeek())
                .font(.callout)
                .fontWeight(.medium)
                .textScale(.secondary)
                .foregroundColor(.gray)
            Text(date.dayOfMonth())
                .font(.system(size: 20))
                .frame(width: 45, height: 45)
                .foregroundStyle(currentDate.isSameDate(comparedDate: date) ? .white : .black)
                .background {
                    if currentDate.isSameDate(comparedDate: date) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.red.opacity(0.75))
                            .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                    }
                    if date.isToday {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(currentDate.isToday ? .white : .red.opacity(0.75))
                            .frame(width: 20, height: 3)
                            .offset(y: -5)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    }
                }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .onTapGesture {
            withAnimation(.snappy) {
                currentDate = date
            }
        }
    }
}
