// AddView.swift
// (c) Alex Fila 27/05/25

import SwiftUI

struct AddView: View {
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    @State private var biomarker: String = "Lab1"
    @State private var showBiomarkerOptions = false
    @State private var value: String = ""
    @State private var dateSelected = false
    @State private var biomarkerSelected = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Add Manually,")
                    .font(.title)
                    .bold()
                    .padding(.leading, 15)

                VStack(spacing: 10) {
                    Divider()
                    
                    Button(action: {
                        withAnimation {
                            showDatePicker.toggle()
                            dateSelected = true
                        }
                    }) {
                        HStack {
                            Text("Date")
                                .foregroundColor(.black)
                            Spacer()
                            if dateSelected {
                                Text("\(selectedDate, formatter: dateFormatter)")
                                    .foregroundColor(.primary)
                            }
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
                            showBiomarkerOptions.toggle()
                            biomarkerSelected = true
                        }
                    }) {
                        HStack {
                            Text("Biomarker")
                                .foregroundColor(.black)
                            Spacer()
                            if biomarkerSelected {
                                Text(biomarker)
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                    if showBiomarkerOptions {
                        HStack {
                            ForEach(["Lab1", "Lab2", "Lab3"], id: \.self) { lab in
                                Text(lab)
                                    .padding()
                                    .background(biomarker == lab ? Color.gray.opacity(0.5) : Color.gray.opacity(0.3))
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        biomarker = lab
                                        showBiomarkerOptions = false
                                    }
                            }
                        }
                    }
                    Divider()

                    TextField("Value", text: $value)
                        .keyboardType(.decimalPad)
                        .padding(.vertical, 10)
                    Divider()
                }
                .padding(.horizontal)

                Spacer()

                Button(action: {
                    // Save logic goes here
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
}

#Preview { AddView() }
