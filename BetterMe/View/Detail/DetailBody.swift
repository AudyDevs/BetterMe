//
//  DetailBody.swift
//  BetterMe
//
//  Created by AudyDev on 18/11/24.
//

import SwiftUI
import SwiftData
    
struct DetailBody: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    let isAddingNew: Bool
    let isSheet: Bool
    
    @Binding var name: String
    @Binding var goal: Int
    @Binding var mesure: String
    @Binding var description: String
    @Binding var frequency: [String]
    @Binding var selectedIcon: String
    @Binding var selectedColor: String
    @Binding var startDate: Date
    @Binding var currentHabit: Habit?
    
    @State var showMenuIcon: Bool = false
    @State var showMenuColor: Bool = false
    @State var showDeleteAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack (spacing: 18) {
                    HStack {
                        CustomTextField(title: "Nombre", text: $name, prompt: "Escribe el hábito", keyboardType: .default)
                        IconTextField(icon: selectedIcon, color: selectedColor)
                            .padding(.top, 33)
                            .onTapGesture {
                                withAnimation {
                                    showMenuIcon.toggle()
                                }
                            }
                    }
                    HStack {
                        CustomTextField(title: "Objetivo", text: Binding(
                            get: { String(goal) },
                            set: { goal = Int($0) ?? 0 }
                        ), prompt: "Marca el objetivo", keyboardType: .numberPad)
                        CustomTextField(title: "Medida", text: $mesure, prompt: "Unidad de medida", keyboardType: .default)
                    }
                    CustomTextField(title: "Descripción", text: $description, prompt: "Escribe una descripción (opcional)", keyboardType: .default)
                    FrequencySelector(title: "Repetir", frequency: $frequency)
                    CustomButton(
                        text: isAddingNew ? "Crea nuevo hábito" : "Modificar hábito",
                        disabled: name.isEmpty || goal == 0 || mesure.isEmpty ,
                        action: {
                            if isAddingNew {
                                let habitModel = Habit(
                                    name: name,
                                    goal: goal,
                                    mesure: mesure,
                                    descriptionText: description,
                                    icon: selectedIcon,
                                    color: selectedColor,
                                    frequency: frequency
                                )
                                context.insert(habitModel)
                            }
                            withAnimation {
                                dismiss()
                            }
                        }
                    )
                    .padding(.top, 8)
                    Spacer()
                }
                .padding(.horizontal)
                .navigationTitle(isAddingNew ? "Nuevo hábito" : "Editar hábito")
                .navigationBarTitleDisplayMode(.inline)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar {
                    if !isAddingNew {
                        ToolbarItem (placement: .navigationBarTrailing) {
                            Button(action: {
                                showDeleteAlert.toggle()
                            }, label: {
                                Label("Eliminar hábito", systemImage: "trash")
                            })
                        }
                    } 
                    if isSheet {
                        ToolbarItem (placement: .navigationBarLeading) {
                            Button(action: {
                                withAnimation {
                                    dismiss()
                                }
                            }, label: {
                                Label("Atras", systemImage: "chevron.left")
                            })
                        }
                    }
                }
                .alert(isPresented: $showDeleteAlert) {
                    Alert(
                        title: Text("¿Seguro que quieres eliminar el hábito?"),
                        message: Text("Se eliminará el hábito permanentemente para los siguientes días."),
                        primaryButton: .destructive(Text("Eliminar hábito")) {
                            context.delete(currentHabit!)
                            try? context.save()
                            withAnimation {
                                dismiss()
                            }
                        },
                        secondaryButton: .cancel()
                    )
                }
                .overlay(
                    VStack {
                        if showMenuIcon {
                            Color.black.opacity(0.3)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    showMenuIcon = false
                                }
                            IconPickerSheet(
                                selectedIcon: $selectedIcon,
                                selectedColor: selectedColor,
                                onAccept: {
                                    showMenuIcon = false
                                    showMenuColor = true
                                }
                            )
                            .animation(.easeInOut, value: showMenuIcon)
                            .transition(.move(edge: .bottom))
                        }
                        if showMenuColor {
                            Color.black.opacity(0.3)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    showMenuColor = false
                                }
                            ColorPickerSheet(
                                selectedColor: $selectedColor,
                                onAccept: {
                                    showMenuColor = false
                                }
                            )
                            .animation(.easeInOut, value: showMenuColor)
                            .transition(.move(edge: .bottom))
                        }
                    }
                )
            }
        }
    }
}

