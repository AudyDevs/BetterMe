//
//  ProgressBar.swift
//  BetterMe
//
//  Created by AudyDev on 14/11/24.
//

import SwiftUI

struct ProgressBar: View {
    let progressPercentage: Double
    @Binding var animatedValue: Double
    @Binding var widthComponent: CGFloat
    
    var body: some View {
        let color = switch progressPercentage {
            case 0 ... 0.24:
                Color.orange.opacity(0.75)
            case 0.24 ... 0.49:
                Color.yellow.opacity(0.75)
            case 0.49 ... 0.74:
                Color.green.opacity(0.75)
            case 0.74 ... 1:
                Color.blue.opacity(0.75)
            default:
                Color.blue.opacity(0.75)
        }
        Text("Progreso del dia")
            .font(.title3)
            .bold()
            .padding(.vertical, 10)
            .padding(.horizontal)
        
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 40)
                .cornerRadius(12)
                .foregroundColor(.gray.opacity(0.25))
                .shadow(color: .gray.opacity(0.25), radius: 6)
                .background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            widthComponent = geometry.size.width
                        }
                })
            Rectangle()
                .frame(width: CGFloat(animatedValue), height: 40)
                .cornerRadius(12)
                .foregroundColor(color)
                .shadow(color: color, radius: 10)
                .animation(.easeInOut(duration: 1.0), value: animatedValue)
            Text(progressPercentage.formatPercentage())
                .frame(maxWidth: .infinity, maxHeight: 40)
                .font(.callout)
                .bold()
        }.onAppear {
            withAnimation {
                animatedValue = progressPercentage * widthComponent
            }
            
        }.onChange(of: progressPercentage) {
            withAnimation {
                animatedValue = progressPercentage * widthComponent
            }
            
        }.padding(.horizontal)
    }
}
