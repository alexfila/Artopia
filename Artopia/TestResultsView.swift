import SwiftUI

struct TestResultsView: View {
    let data: [TestResult] = sampleData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Test Results")
                    .font(.largeTitle)
                    .bold()
                Text("Annual Haemoglobin Trend Analysis.")
                    .font(.headline)
                Text("Track your Haemoglobin levels month by month over the past year.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Placeholder for chart
                Rectangle()
                    .fill(Color(.systemGray6))
                    .frame(height: 200)
                    .overlay(Text("[Chart Placeholder]"))
                    .cornerRadius(10)

                ForEach(data) { result in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Hemoglobin")
                                .bold()
                            Spacer()
                            Text(result.dateFormatted)
                                .foregroundColor(.gray)
                        }
                        Text("\(result.value, specifier: "%.1f") \(result.unit)")
                        ProgressView(value: result.normalized, total: 1.0)
                            .accentColor(result.status == "Normal" ? .green : .yellow)
                        Text(result.status)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 1)
                }
            }
            .padding()
        }
    }
}

struct TestResult: Identifiable {
    let id = UUID()
    let value: Double
    let unit: String
    let status: String
    let date: Date

    var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM ,yyyy"
        return formatter.string(from: date)
    }

    var normalized: Double {
        return min(max((value - 10.0) / (16.0 - 10.0), 0.0), 1.0)
    }
}

let sampleData = [
    TestResult(value: 13.5, unit: "g/dL", status: "Normal", date: DateComponents(calendar: .current, year: 2023, month: 5).date!),
    TestResult(value: 13.0, unit: "10^9/L", status: "Normal", date: DateComponents(calendar: .current, year: 2023, month: 4).date!),
    TestResult(value: 12.5, unit: "10^9/L", status: "Normal", date: DateComponents(calendar: .current, year: 2023, month: 3).date!),
    TestResult(value: 11.2, unit: "g/dL", status: "Low", date: DateComponents(calendar: .current, year: 2023, month: 2).date!)
]
