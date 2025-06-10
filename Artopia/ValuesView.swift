import SwiftUI

struct ValuesView: View {
    let selectedParameters: Set<String>
    // RBC Parameters
    @State private var hemoglobin = ""
    @State private var rbcCount = ""
    @State private var pcv = ""
    @State private var mcv = ""
    @State private var mch = ""
    @State private var mchc = ""
    @State private var rdwCV = ""
    @State private var rdwSD = ""
    
    // WBC Parameters
    @State private var tlc = ""
    
    // Differential Leucocyte Count
    @State private var neutrophils = ""
    @State private var lymphocytes = ""
    @State private var monocytesEosinophils = ""
    @State private var eosinophils = ""
    @State private var basophils = ""
    
    // Platelet Parameters
    @State private var plateletCount = ""
    @State private var mpv = ""
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("🔍 Search", text: $searchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "mic.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        )
                    
                    Divider()
                    
                    Text("RBC PARAMETERS")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.6, green: 0.1, blue: 0.1))
                        .textCase(.uppercase)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Hemoglobin")
                        TextField("g/dL", text: $hemoglobin)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("RBC Count")
                        TextField("10^6/μl", text: $rbcCount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("PCV")
                        TextField("%", text: $pcv)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("MCV")
                        TextField("fl", text: $mcv)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("MCH")
                        TextField("pg", text: $mch)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("MCHC")
                        TextField("g/dL", text: $mchc)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("RDW (CV)")
                        TextField("%", text: $rdwCV)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("RDW-SD")
                        TextField("fl", text: $rdwSD)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    Text("WBC PARAMETERS")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.6, green: 0.1, blue: 0.1))
                        .textCase(.uppercase)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("TLC")
                        TextField("10^3/μl", text: $tlc)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    Text("DIFFERENTIAL LEUCOCYTE COUNT")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.6, green: 0.1, blue: 0.1))
                        .textCase(.uppercase)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Neutrophils")
                        TextField("10^3/μl", text: $neutrophils)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("Lymphocytes")
                        TextField("10^3/μl", text: $lymphocytes)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("Monocytes Eosinophils")
                        TextField("10^3/μl", text: $monocytesEosinophils)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("Eosinophils")
                        TextField("10^3/μl", text: $eosinophils)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("Basophils")
                        TextField("10^3/μl", text: $basophils)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    Text("PLATELET PARAMETERS")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.6, green: 0.1, blue: 0.1))
                        .textCase(.uppercase)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Platelet Count")
                        TextField("10^3/μl", text: $plateletCount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading) {
                        Text("Mean Platelet Volume (MPV)")
                        TextField("fl", text: $mpv)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                    }
                    .padding(5)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveValues()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Biomarker")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @Environment(\.dismiss) private var dismiss

    private func saveValues() {
        // TODO: Implement saving logic
        print("Saved values:")
        print("Hemoglobin: \(hemoglobin), RBC Count: \(rbcCount), ...")
    }
}

#Preview { ValuesView(selectedParameters: []) }
