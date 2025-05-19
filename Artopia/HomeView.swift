import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome,")
                    .font(.largeTitle)
                    .bold()
                Text("Analysis of your blood test metrics and their status")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                VStack(spacing: 16) {
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "document.badge.plus.fill")
                                .font(.largeTitle)
                                .padding(.bottom, 4)
                            Text("Upload Your CBC Test")
                                .font(.headline)
                            Text("Upload your test results or scan them directly")
                                .font(.caption)
                                .foregroundColor(.gray)
                            HStack(spacing: 20) {
                                Button("Upload") {}.buttonStyle(BloodButtonStyle())
                                Button(action: {}) {
                                    Label("Scan", systemImage: "camera.fill")
                                }
                                .buttonStyle(BloodButtonStyle())
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    }

                    Button(action: {}) {
                        VStack {
                            Image(systemName: "plus.square.fill")
                                .font(.largeTitle)
                                .padding(.bottom, 4)
                            Text("Add By Yourself")
                                .font(.headline)
                            Text("Add Blood Test Manually")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Button("Add") {}
                                .buttonStyle(BloodButtonStyle())
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    }
                }
                .padding(.top)
                Spacer()
            }
            .padding()
            .navigationBarItems(trailing: Image(systemName: "chart.bar.xaxis"))
        }
    }
}

#Preview { HomeView() }


