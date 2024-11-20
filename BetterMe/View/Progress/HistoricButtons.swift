//
//  HistoricButtons.swift
//  BetterMe
//
//  Created by AudyDev on 19/11/24.
//

import SwiftUI

struct HistoricButtons: View {
    let color: Color
    let showButtons: Bool
    let showComplete: Bool
    let onMinusTap: () -> Void
    let onPlusTap: () -> Void
    
    var body: some View {
        if showComplete {
            Image(systemName: "checkmark")
                .resizable()
                .scaledToFit()
                .frame(width: 17, height: 17)
                .foregroundColor(color)
                .font(.system(size: 10))
                .padding(8)
                .background(Color.white)
                .mask(Circle())
                .shadow(color: color, radius: 10)
        } else {
            if showButtons {
                Image(systemName: "minus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                    .foregroundColor(Color.white)
                    .font(.system(size: 10))
                    .padding(8)
                    .background(color)
                    .mask(Circle())
                    .shadow(color: color, radius: 10)
                    .padding(.trailing, 6)
                    .onTapGesture {
                        onMinusTap()
                    }
                
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                    .foregroundColor(Color.white)
                    .font(.system(size: 10))
                    .padding(8)
                    .background(color)
                    .mask(Circle())
                    .shadow(color: color, radius: 10)
                    .onTapGesture {
                        onPlusTap()
                    }
            }
        }
    }
}
