// CustomButtons.swift
// (c) Alex Fila 19/05/25

import SwiftUI

struct BloodButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color(red: 0.5, green: 0, blue: 0))
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}
