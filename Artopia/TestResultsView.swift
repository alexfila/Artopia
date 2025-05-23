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

struct TestResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultsView()
    }
}

// MARK: - DetailedTestResultsView & Triangle Shape

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct DetailedTestResultsView: View {
    let data: [TestResult] = sampleData

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Test Results")
                        .font(.title)
                        .bold()
                    Text("Analysis of your blood test metrics and their status.")
                        .font(.body)
                    Text("Lab Name: Laboratorio Analisi Mediche San Giovanni (Italy)")
                    Text("Test Date: May 12, 2025")
                    Text("Test Type: Complete Blood Count (CBC)")
                }

                // Results
                ForEach(data) { result in
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Hemoglobin") // You might vary this based on actual test type
                            .font(.headline)

                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("\(result.value, specifier: "%.1f") \(result.unit)")
                                    .font(.title3)
                                    .bold()
                                Spacer()
                                Text(result.dateFormatted)
                                    .foregroundColor(.gray)
                            }

                            HStack(spacing: 8) {
                                Circle()
                                    .fill(result.status == "Normal" ? Color.green : Color.yellow)
                                    .frame(width: 10, height: 10)
                                Text(result.status == "Normal" ? "Normal" : "Slightly Low")
                                    .font(.subheadline)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(height: 8)
                                    Capsule()
                                        .fill(Color.green)
                                        .frame(width: CGFloat(result.normalized) * 200, height: 8)
                                    Triangle()
                                        .fill(Color.orange)
                                        .frame(width: 10, height: 10)
                                        .offset(x: CGFloat(result.normalized) * 200 - 5, y: -5)
                                }
                                .frame(height: 16)

                                HStack {
                                    Text("Min").font(.caption)
                                    Spacer()
                                    Text("Max").font(.caption)
                                }

                                Text("May suggest mild anemia, which can cause fatigue or weakness")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 1)
                    }
                }
            }
            .padding()
        }
    }
}

struct DetailedTestResultsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedTestResultsView()
    }
}
