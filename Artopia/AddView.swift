// AddView.swift
// (c) Alex Fila 27/05/25

import SwiftUI

struct AddView: View {
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    @State private var value: String = ""
    @State private var dateSelected = false
    @State private var showValuesOptions = false
    @State private var selectedValues: Set<String> = []
    @State private var navigateToValuesView = false
    // Computed property to check if all required fields are selected
    private var isFormValid: Bool {
        dateSelected && !selectedValues.isEmpty
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Add Manually,")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 15)

                VStack(spacing: 10) {
                    Divider()
                    
                    Button(action: {
                        withAnimation {
                            showDatePicker.toggle()
                            dateSelected = showDatePicker
                        }
                    }) {
                        HStack {
                            Text("Date")
                                .foregroundColor(.black)
                            Spacer()
                            Toggle(isOn: $dateSelected) {
                                EmptyView()
                            }
                            .labelsHidden()
                            .disabled(true)
                        }
                        .padding(.vertical, 10)
                    }
                    if showDatePicker {
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                            .padding(.bottom)
                    }

                    Divider()

                    Button(action: {
                        withAnimation {
                            showValuesOptions.toggle()
                        }
                    }) {
                        HStack {
                            Text("Biomarker")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                    }
                    if showValuesOptions {
                        ScrollView(.vertical) {
                            VStack(alignment: .leading, spacing: 12) {
                                Group {
                                    Text("RBC PARAMETERS").font(.caption).foregroundColor(.gray)
                                    valueHStack(["Hemoglobin", "RBC Count", "PCV", "MCV", "MCH", "MCHC", "RDW (CV)", "RDW-SD"])

                                    Text("WBC PARAMETERS").font(.caption).foregroundColor(.gray)
                                    valueHStack(["TLC"])

                                    Text("DIFFERENTIAL LEUCOCYTE COUNT").font(.caption).foregroundColor(.gray)
                                    valueHStack(["Neutrophils", "Lymphocytes", "Monocytes Eosinophils", "Eosinophils", "Basophils"])

                                    Text("PLATELET PARAMETERS").font(.caption).foregroundColor(.gray)
                                    valueHStack(["Platelet Count", "Mean Platelet Volume (MPV)"])
                                }
                            }
                        }
                    }
                    Divider()
                }
                .padding(.horizontal)

                Spacer()

                Button(action: {
                    navigateToValuesView = true
                }) {
                    Text("Save & Continue")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isFormValid ? Color(red: 0.6, green: 0.1, blue: 0.1) : Color.gray)
                        .cornerRadius(16)
                }
                .disabled(!isFormValid)
                .padding(.horizontal)
                .padding(.bottom)
                NavigationLink(
                    destination: ValuesView(selectedParameters: selectedValues),
                    isActive: $navigateToValuesView,
                    label: { EmptyView() }
                )
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @ViewBuilder
    private func valueHStack(_ items: [String]) -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
            ForEach(items, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    if selectedValues.contains(item) {
                        Image(systemName: "checkmark")
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .onTapGesture {
                    if selectedValues.contains(item) {
                        selectedValues.remove(item)
                    } else {
                        selectedValues.insert(item)
                    }
                }
            }
        }
    }
}

#Preview { AddView() }
