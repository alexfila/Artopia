// CustomButtons.swift
// (c) Alex Fila 19/05/25

import SwiftUI

struct CustomButtons: View {
//    var symbol: String
//    var text: String
    
//    init(_ button: String) { switch button {
//    case "Upload": symbol = "chevron.backward.circle", text = "Upload"
//    case "Scan": symbol = "chevron.forward.circle", text = "Scan"
//    case "Add", _: symbol = "checkmark.circle.fill", text = "Add"}}
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

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


#Preview { CustomButtons() }
