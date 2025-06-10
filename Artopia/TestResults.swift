import SwiftUI

struct TestResults: View {
    let testDate: Date

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Test Result")
                        .font(.title)
                        .bold()
                    Text("Analysis of your blood test metrics and their status.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Test Date: \(formattedDate)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                }

                TestMetricCard(
                    title: "Hemoglobin",
                    valueText: "11.5 g/dL",
                    statusColor: .yellow,
                    statusLabel: "Slightly Low",
                    min: 5, normalMin: 12, normalMax: 16, max: 22,
                    userValue: 11.5,
                    description: "May suggest mild anaemia, which can cause fatigue or weakness."
                )

                TestMetricCard(
                    title: "Neutrophils",
                    valueText: "8.4 10⁹/L",
                    statusColor: .green,
                    statusLabel: "Normal",
                    min: 1, normalMin: 4, normalMax: 10, max: 50,
                    userValue: 8.4,
                    description: "White blood cells help defend the body against infections."
                )

                TestMetricCard(
                    title: "Platelets",
                    valueText: "130 10⁹/L",
                    statusColor: .yellow,
                    statusLabel: "Slightly Low",
                    min: 10, normalMin: 150, normalMax: 400, max: 1000,
                    userValue: 130,
                    description: "White blood cells help defend the body against infections."
                )
            }
            .padding()
        }
    }

    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: testDate)
    }
}

struct TestMetricCard: View {
    let title: String
    let valueText: String
    let statusColor: Color
    let statusLabel: String
    let min: Double
    let normalMin: Double
    let normalMax: Double
    let max: Double
    let userValue: Double
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title3)
                .bold()
            HStack {
                Text(valueText)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 6) {
                    Circle()
                        .fill(statusColor)
                        .frame(width: 12, height: 12)
                    Text(statusLabel)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }.padding(.bottom, 15)

            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 16)
                Capsule()
                    .fill(Color.green.opacity(0.3))
                    .frame(width: barWidth(for: normalMax - normalMin), height: 16)
                    .offset(x: barOffset(for: normalMin))
                Triangle()
                    .fill(Color(red: 0.6, green: 0.1, blue: 0.1))
                    .frame(width: 15, height: 15)
                    .offset(x: barOffset(for: userValue) - 5, y: -10)
                Text("\(userValue, specifier: "%.1f")")
                    .font(.caption2)
                    .foregroundColor(Color(red: 0.6, green: 0.1, blue: 0.1))
                    .offset(x: barOffset(for: userValue) - 20, y: -25)
            }
            .padding(.vertical, 4)

            HStack {
                Text("Min")
                Spacer()
                Text("Max")
            }
            .font(.caption)
            .foregroundColor(.gray)

            HStack {
                Text("\(min, specifier: "%.0f")")
                Spacer()
                Text("\(max, specifier: "%.0f")")
            }
            .font(.caption2)
            .foregroundColor(.gray)

            Text(description)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.top, 4)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 1)
    }

    private func barWidth(for value: Double) -> CGFloat {
        let total = max - min
        return CGFloat(value / total) * UIScreen.main.bounds.width * 0.8
    }

    private func barOffset(for value: Double) -> CGFloat {
        let total = max - min
        return CGFloat((value - min) / total) * UIScreen.main.bounds.width * 0.8
    }
}

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

#Preview {
    TestResults(testDate: Date())
}
