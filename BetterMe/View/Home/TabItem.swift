//
//  TabItem.swift
//  BetterMe
//
//  Created by AudyDev on 13/11/24.
//

import SwiftUI

struct TabItem<Content: View>: View {
    let title: String
    let icon: String
    let view: Content
    
    init(title: String, icon: String, @ViewBuilder view: () -> Content) {
        self.title = title
        self.icon = icon
        self.view = view()
    }
    
    var body: some View {
        ZStack {
            VStack {
                view
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 73)
                    .foregroundColor(.white)
                    .cornerRadius(24)
                    .padding(24)
                    .shadow(color: Color.white, radius: 12)
            }
        }.edgesIgnoringSafeArea(.all)
        .tabItem {
            Image(systemName: icon)
            Text(title)
        }
    }
}
