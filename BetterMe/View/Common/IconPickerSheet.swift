//
//  IconPickerSheet.swift
//  BetterMe
//
//  Created by AudyDev on 15/11/24.
//

import SwiftUI

struct IconPickerSheet: View {
    @Binding var selectedIcon: String
    let selectedColor: String
    let onAccept: () -> Void

    let icons: [String] = [
        "house", "bell", "heart", "star", "gear", "person", "book", "cart",
        "camera", "folder", "magnifyingglass", "phone"
    ]
    
    var body: some View {
        let itemColor = if !selectedColor.isEmpty {
            selectedColor.toColor()
        } else {
            Color.red
        }
        
        VStack(spacing: 8) {
            Text("Selecciona un icono")
                .font(.title3)
                .padding(.top, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: 8), count: 2), spacing: 16) {
                    ForEach(icons, id: \.self) { icon in
                        Button(action: {
                            selectedIcon = icon
                        }) {
                            Image(systemName: icon)
                                .foregroundStyle(itemColor.opacity(0.75))
                                .font(.title)
                                .frame(width: 55, height: 55)
                                .background(selectedIcon == icon ? itemColor.opacity(0.3) : Color.clear)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(selectedIcon == icon ? itemColor.opacity(0.75) : Color.gray.opacity(0.5), lineWidth: 2)
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
