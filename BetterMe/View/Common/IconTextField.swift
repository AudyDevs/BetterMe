//
//  IconTextField.swift
//  BetterMe
//
//  Created by AudyDev on 15/11/24.
//

import SwiftUI

struct IconTextField: View {
    let icon: String
    let color: String
    
    var body: some View {
        Image(systemName: icon)
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .foregroundStyle(color.toColor())
            .padding(14)
            .background(.gray.opacity(0.2))
            .cornerRadius(18)
    }
}
