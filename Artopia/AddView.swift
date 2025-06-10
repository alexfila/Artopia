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
                VStack(spacing: 10) {
                    Divider()
                    
                    Button(action: {
                        withAnimation {
                            showDatePicker.toggle()
                            if !showDatePicker {
                                dateSelected = true
                            }
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

                    NavigationLink(
                        destination: ValuesView(selectedParameters: selectedValues),
                        label: {
                            HStack {
                                Text("Biomarker")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.vertical, 10)
                        }
                    )
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
                        .background(Color(red: 0.6, green: 0.1, blue: 0.1))
                        .cornerRadius(16)
                }
                .padding(.horizontal)
                .padding(.bottom)
                NavigationLink(
                    destination: TestResults(testDate: selectedDate),
                    isActive: $navigateToValuesView,
                    label: { EmptyView() }
                )
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .navigationTitle("Add Manually")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
}

#Preview { AddView() }
  
