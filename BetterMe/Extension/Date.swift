//
//  DateExtension.swift
//  BetterMe
//
//  Created by AudyDev on 13/11/24.
//

import SwiftUI

extension Date {
    var firstDayView: Date {
        return Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date()
    }
    
    var lastDayView: Date {
        return Calendar.current.date(byAdding: .day, value: 10, to: Date()) ?? Date()
    }
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    func isSameDate(comparedDate: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: comparedDate)
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d 'de' MMMM"
        dateFormatter.locale = Locale(identifier: "es_ES")
        return dateFormatter.string(from: self)
    }
    
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        dateFormatter.locale = Locale(identifier: "es_ES")
        return dateFormatter.string(from: self).capitalized
    }
    
    func dayOfMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    
    func startOfDay() -> Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: self)
    }
    
    func fetchDays() -> [Date] {
        let calendar = Calendar.current
        var currentDate = firstDayView
        var days: [Date] = []

        while currentDate <= lastDayView {
            days.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
            
        }
        
        return days
    }
}
