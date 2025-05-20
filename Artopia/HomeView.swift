import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome,")
                    .font(.title)
                    .bold()
                Text("Analysis of your blood test metrics and their status")
                    .font(.headline)
                    .bold()
                
                VStack(spacing: 16) {
                    Button(action: {}) {
                        VStack(spacing: 20) {
                            Image(systemName: "document.badge.plus.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(.bottom, 4)
                            Text("Upload Your CBC Test")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                            Text("Upload your test results or scan them directly")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.gray)
                            HStack(spacing: 20) {
                                Button(action: {}) {
                                    Label("Upload", systemImage: "tray.and.arrow.up.fill")
                                        .bold()
                                        .padding(.horizontal, 15)
                                }.buttonStyle(BloodButtonStyle())
                                Button(action: {}) {
                                    Label("Scan", systemImage: "camera.fill")
                                        .bold()
                                        .padding(.horizontal, 15)
                                }
                                .buttonStyle(BloodButtonStyle())
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 1)
                    }

                    Button(action: {}) {
                        VStack(spacing: 20) {
                            Image(systemName: "folder.fill.badge.plus")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(.bottom, 4)
                            Text("Add By Yourself")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                            Text("Add Blood Test Manually")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.gray)
                            Button(action: {}) {
                                Label("Add", systemImage: "plus")
                                    .bold()
                                    .padding(.horizontal, 15)
                            }
                                .buttonStyle(BloodButtonStyle())
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 1)
                    }
                }
                .padding(.top)
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .navigationBarItems(trailing: Image(systemName: "chart.bar.xaxis"))
        }
    }
}

#Preview { HomeView() }


