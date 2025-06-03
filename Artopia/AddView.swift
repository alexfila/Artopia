// AddView.swift
// (c) Alex Fila 27/05/25 

import SwiftUI

struct AddView: View {
    @State private var hemoglobin: String = ""
    @State private var neutrophils: String = ""
    @State private var platelets: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Hemoglobin (e.g. 10.0)", text: $hemoglobin)
                    .keyboardType(.decimalPad)
                
                TextField("Neutrophils (e.g. 10.0)", text: $neutrophils)
                    .keyboardType(.decimalPad)
                
                TextField("Platelets (e.g. 10.0)", text: $platelets)
                    .keyboardType(.decimalPad)
            }
        }
        .navigationTitle("Add Values")
    }
}

#Preview { AddView() }
