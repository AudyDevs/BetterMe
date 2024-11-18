//
//  ColorPickerSheet.swift
//  BetterMe
//
//  Created by AudyDev on 16/11/24.
//

import SwiftUI

struct ColorPickerSheet: View {
    @Binding var selectedColor: String
    let onAccept: () -> Void

    let colors: [String] = [
        "black", "blue", "brown", "cyan", "gray", "green", "indigo",
        "mint", "orange", "pink", "purple", "red", "teal", "yellow"
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Selecciona un color")
                .font(.title3)
                .padding(.top, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: 8), count: 2), spacing: 16) {
                    ForEach(colors, id: \.self) { color in
                        Button(action: {
                            selectedColor = color
                        }) {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(color.toColor())
                                .frame(width: 55, height: 55)
                                .overlay(
                                    Image(systemName: "checkmark.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundStyle(selectedColor == color ? Color.white : Color.white.opacity(0))
                                )
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .frame(height: 160)

            Button(action: {
                onAccept()
            }) {
                Text("Aceptar")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(Color.red.opacity(0.75))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.height * 0.33)
        .offset(y: -20)
        .transition(.move(edge: .bottom))
    }
}
