//
//  Formats.swift
//  BetterMe
//
//  Created by AudyDev on 14/11/24.
//

import Foundation

extension Double {
    func formatPercentage() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.locale = Locale(identifier: "es_ES")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
