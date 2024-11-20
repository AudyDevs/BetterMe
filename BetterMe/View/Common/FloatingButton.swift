//
//  FloatingButton.swift
//  BetterMe
//
//  Created by AudyDev on 14/11/24.
//

import SwiftUI

struct FloatingButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
                .font(.system(size: 8, weight: .bold))
        }
        .padding(5)
        .background(Color.red.opacity(0.75))
        .mask(Circle())
        .shadow(color: Color.red.opacity(0.75), radius: 8)
    }
}
