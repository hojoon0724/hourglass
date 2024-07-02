//
//  SettingsPage.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/19/24.
//

import SwiftData
import SwiftUI

struct SettingsPage: View {
    let nsObject: Any? = Bundle.main.infoDictionary!["CFBundleShortVersionString"]

    // @StateObject private var colorSchemeManager = ColorSchemeManager() also works, but .shared avoids fragmentation and keeps all instances share the same state
    @StateObject private var colorSchemeManager = ColorSchemeManager.shared
    @StateObject private var userSettingsValues = UserSettingsValues.shared

    @EnvironmentObject var localNotificationsManager: LocalNotificationManager

    @State private var firstAlertModal: Bool = false
    @State private var secondAlertModal: Bool = false

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
                        Toggle(isOn: userSettingsValues.$switchAlert1) {
                            Text("First Alert")
                        }
                        .onChange(of: userSettingsValues.switchAlert1) {
                            userSettingsValues.switchAlert2 = false
                        }
                    }

                    if userSettingsValues.switchAlert1 {
                        HStack {
                            Text("When time goes below")
                            Spacer()
                            Text("\(secondsToFullTime(userSettingsValues.firstAlertThreshold))")
                                .monospaced()
                        }
                        .onTapGesture {
                            self.firstAlertModal = true
                        }
                        .sheet(isPresented: self.$firstAlertModal) {
                            alertTimeModal(threshold: userSettingsValues.$firstAlertThreshold, text: "First Alert at: ")
                                .presentationDetents([.height(230)])
                        }

                        HStack {
                            Toggle(isOn: userSettingsValues.$switchAlert2) {
                                Text("Second Alert")
                            }
                            .disabled(userSettingsValues.switchAlert1 == false)
                            .onDisappear { userSettingsValues.switchAlert2 = false }
                        }
                    }

                    if userSettingsValues.switchAlert2 {
                        HStack {
                            Text("When time goes below")
                            Spacer()
                            Text("\(secondsToFullTime(userSettingsValues.secondAlertThreshold))")
                                .monospaced()
                        }
                        .onTapGesture {
                            self.secondAlertModal = true
                        }
                        .sheet(isPresented: self.$secondAlertModal) {
                            alertTimeModal(threshold: userSettingsValues.$secondAlertThreshold, text: "Second Alert at: ")
                                .presentationDetents([.height(230)])
                        }
                    }

                } header: {
                    Text("Notifications (NOT WORKING YET)")
                } footer: {
                    Text("Sends you a notification when the client's remaining time goes below this threshold")
                }

                Section {
                    Button("Notify") {
                        Task {
                            let testNotification = LocalNotification(identifier: UUID().uuidString, title: "time warning", body: "client has Xhrs left \(userSettingsValues.firstAlertThreshold)", timeInterval: 5.0, repeats: false)
                            await localNotificationsManager.schedule(localNotification: testNotification)
                        }
                    }
                    Button("Cancel") {
                        Task {
                            localNotificationsManager.removeRequest()
                        }
                    }
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
            .onAppear {
            }
        }
    }
}

#Preview {
    ContentView(selectedTab: "SettingsPage")
        .environmentObject(LocalNotificationManager())
        .modelContainer(SampleData.shared.modelContainer)
}
