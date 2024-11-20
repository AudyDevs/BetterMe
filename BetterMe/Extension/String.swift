//
//  String.swift
//  BetterMe
//
//  Created by AudyDev on 15/11/24.
//

import Foundation
import SwiftUI

extension String {
    func toColor() -> Color {
       return switch self {
       case "black": Color.black
        case "blue": Color.blue
        case "brown": Color.brown
        case "cyan": Color.cyan
        case "gray": Color.gray
        case "green": Color.green
        case "indigo": Color.indigo
        case "mint": Color.mint
        case "orange": Color.orange
        case "pink": Color.pink
        case "purple": Color.purple
        case "red": Color.red
        case "teal": Color.teal
        case "white": Color.white
        case "yellow": Color.yellow
        default: Color.black
        }
    }
}

extension [String] {
    func setFrequency() -> String {
        var result = ""
        let workableDays = ["Lun", "Mar", "Mié", "Jue", "Vie"]
        let weekendDays = ["Sáb", "Dom"]
        
        if self.count == 7 {
            result = "Todos los días"
        } else if self.count == 5 && workableDays.allSatisfy({ self.contains($0) }) {
            result = "Laborables"
        } else if self.count == 2 && weekendDays.allSatisfy({ self.contains($0) }) {
            result = "Festivos"
        } else {
            for day in self {
                result = result + day + ", "
            }
            if !result.isEmpty {
                result = String(result.dropLast(2))
            }
        }
        return result
    }
}
