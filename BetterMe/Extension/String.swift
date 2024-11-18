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
