//
//  Settings.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftUI

struct SettingsPage: View {
    let nsObject: Any? = Bundle.main.infoDictionary!["CFBundleShortVersionString"]

    @StateObject private var colorSchemeManager = ColorSchemeManager.shared

    // @StateObject private var colorSchemeManager = ColorSchemeManager() also works, but .shared avoids fragmentation and keeps all instances share the same state

    @State var switchAlert1: Bool = UserDefaults.standard.bool(forKey: "switchAlert1")
    @State var firstAlertThreshold: Int = UserDefaults.standard.integer(forKey: "firstAlertThreshold")

    @State var switchAlert2: Bool = UserDefaults.standard.bool(forKey: "switchAlert2")
    @State var secondAlertThreshold: Int = UserDefaults.standard.integer(forKey: "secondAlertThreshold")

    @State var firstAlertModal: Bool = false
    @State var secondAlertModal: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    // $colorSchemeManager.selectedColorScheme => acts as @State var in global class
                    Picker("Appearance", selection: $colorSchemeManager.selectedColorScheme) {
                        Text("System Setting").tag("Auto")
                        Text("Light").tag("Light")
                        Text("Dark").tag("Dark")
                    }
                    .pickerStyle(.automatic)
                }

                Section {
                    HStack {
                        Toggle(isOn: $switchAlert1) {
                            Text("First Alert")
                        }.onChange(of: switchAlert1) { _, _ in
                            UserDefaults.standard.set(switchAlert1, forKey: "switchAlert1")
                            switchAlert2 = false
                        }
                    }

                    if switchAlert1 {
                        HStack {
                            Text("When under")
                            Spacer()
                            Text("\(secondsToFullTime(firstAlertThreshold))")
                                .monospaced()
                        }
                        .onTapGesture {
                            withAnimation {
                                self.firstAlertModal = true
                            }
                        }
                        .sheet(isPresented: self.$firstAlertModal) {
                            alertTimeModal(threshold: firstAlertThreshold, text: "First Alert at: ")
                                .presentationDetents([.height(230)])
                        }
                    }
                } header: {
                    Text("Notifications (NOT WORKING YET)")
                } footer: {
                    Text("Sends you a notification when the client's account dips below this threshold")
                }

                Section {
                    HStack {
                        Toggle(isOn: $switchAlert2) {
                            Text("Second Alert")
                        }
                        .disabled(switchAlert1 == false)
                        .onChange(of: switchAlert2) { _, _ in
                            UserDefaults.standard.set(switchAlert2, forKey: "switchAlert2")
                        }
                        .onDisappear { switchAlert2 = false }
                    }

                    if switchAlert2 {
                        HStack {
                            Text("When under")
                            Spacer()
                            Text("\(secondsToFullTime(secondAlertThreshold))")
                                .monospaced()
                        }
                        .onTapGesture {
                            self.secondAlertModal = true
                        }
                        .sheet(isPresented: self.$secondAlertModal) {
                            alertTimeModal(threshold: secondAlertThreshold, text: "Second Alert at: ")
                                .presentationDetents([.height(230)])
                        }
                    }
                }
                footer: {
                    Text("Sends you another notification when the client's account dips below this threshold")
                }

                Section {
                    Button(action: {
                        EmailController.shared.sendEmail(subject: "Hourglass Feedback", body: "", to: "hojoon.kim@iCloud.com")
                    }) {
                        Text("Email Feedback")
                    }
                } header: {
                    Text("Feedback")
                        .padding(.top, 50.0)
                } footer: {
                    Text("Help me make it better! \nSend me your feature requests or bug reports anytime")
                }

                Section {
                } footer: {
                    HStack {
                        Text("Version \(nsObject!)")
                            .font(.subheadline)
                    }
                    .padding(.top, 20)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView(selectedTab: "SettingsPage")
        .modelContainer(SampleData.shared.modelContainer)
}
