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
    
    var body: some View {
        NavigationView {
            Form {
                // RBC Parameters Section
                if selectedParameters.contains("Hemoglobin") || selectedParameters.contains("RBC Count") ||
                    selectedParameters.contains("PCV") || selectedParameters.contains("MCV") ||
                    selectedParameters.contains("MCH") || selectedParameters.contains("MCHC") ||
                    selectedParameters.contains("RDW (CV)") || selectedParameters.contains("RDW-SD") {
                    Section(header: Text("RBC PARAMETERS")
                        .font(.headline)
                        .foregroundColor(.primary)) {
                        
                        if selectedParameters.contains("Hemoglobin") {
                            HStack {
                                Text("Hemoglobin")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("g/dL", text: $hemoglobin)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("RBC Count") {
                            HStack {
                                Text("RBC Count")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("10^6/μl", text: $rbcCount)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("PCV") {
                            HStack {
                                Text("PCV")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("%", text: $pcv)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("MCV") {
                            HStack {
                                Text("MCV")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("fl", text: $mcv)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("MCH") {
                            HStack {
                                Text("MCH")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("pg", text: $mch)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("MCHC") {
                            HStack {
                                Text("MCHC")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("g/dL", text: $mchc)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("RDW (CV)") {
                            HStack {
                                Text("RDW (CV)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("%", text: $rdwCV)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("RDW-SD") {
                            HStack {
                                Text("RDW-SD")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("fl", text: $rdwSD)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                    }
                }
                
                // WBC Parameters Section
                if selectedParameters.contains("TLC") {
                    Section(header: Text("WBC PARAMETERS")
                        .font(.headline)
                        .foregroundColor(.primary)) {
                        
                        if selectedParameters.contains("TLC") {
                            HStack {
                                Text("TLC")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("10^3/μl", text: $tlc)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                    }
                }
                
                // Differential Leucocyte Count Section
                if selectedParameters.contains("Neutrophils") || selectedParameters.contains("Lymphocytes") ||
                    selectedParameters.contains("Monocytes Eosinophils") || selectedParameters.contains("Eosinophils") ||
                    selectedParameters.contains("Basophils") {
                    Section(header: Text("DIFFERENTIAL LEUCOCYTE COUNT")
                        .font(.headline)
                        .foregroundColor(.primary)) {
                        
                        if selectedParameters.contains("Neutrophils") {
                            HStack {
                                Text("Neutrophils")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("10^3/μl", text: $neutrophils)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("Lymphocytes") {
                            HStack {
                                Text("Lymphocytes")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("10^3/μl", text: $lymphocytes)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("Monocytes Eosinophils") {
                            HStack {
                                Text("Monocytes Eosinophils")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("10^3/μl", text: $monocytesEosinophils)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("Eosinophils") {
                            HStack {
                                Text("Eosinophils")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("10^3/μl", text: $eosinophils)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("Basophils") {
                            HStack {
                                Text("Basophils")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("10^3/μl", text: $basophils)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                    }
                }
                
                // Platelet Parameters Section
                if selectedParameters.contains("Platelet Count") || selectedParameters.contains("Mean Platelet Volume (MPV)") {
                    Section(header: Text("PLATELET PARAMETERS")
                        .font(.headline)
                        .foregroundColor(.primary)) {
                        
                        if selectedParameters.contains("Platelet Count") {
                            HStack {
                                Text("Platelet Count")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("10^3/μl", text: $plateletCount)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                        
                        if selectedParameters.contains("Mean Platelet Volume (MPV)") {
                            HStack {
                                Text("Mean Platelet Volume (MPV)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("fl", text: $mpv)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.decimalPad)
                                    .frame(width: 100)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Blood Test Parameters")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview { ValuesView(selectedParameters: []) }
