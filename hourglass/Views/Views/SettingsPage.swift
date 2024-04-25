//
//  Settings.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftUI

struct SettingsPage: View {
    let nsObject: Any? = Bundle.main.infoDictionary!["CFBundleShortVersionString"]

    @State var switchAlert1: Bool = false
    @State var firstAlertThreshold: Int = 7200

    @State var switchAlert2: Bool = false
    @State var secondAlertThreshold: Int = 3600

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Toggle(isOn: $switchAlert1) {
                            Text("First Alert")
                        }.onTapGesture {
                            print("switch 1\(switchAlert1)")
                            print("switch 2\(switchAlert2)")
                        }
                    }

                    if switchAlert1 {
                        HStack {
                            Text("When under")
                            Spacer()
                            Text("\(secondsToFullTime(firstAlertThreshold))")
                                .monospaced()
                        }
//                            .transition(.slide)
                    }
                } header: {
                    Text("Notifications (NOT WORKING YET)")
                } footer: {
                    Text("Sends you a notification when the client's account dips below this threshold")
                }

                if switchAlert1 {
                    Section {
                        HStack {
                            Toggle(isOn: $switchAlert2) {
                                Text("Second Alert")
                            }
                        }.onDisappear { switchAlert2 = false }

                        if switchAlert2 {
                            HStack {
                                Text("When under")
                                Spacer()
                                Text("\(secondsToFullTime(secondAlertThreshold))")
                                    .monospaced()
                            }
//                                .transition(.slide)
                        }
                    }
                    footer: {
                        Text("Sends you another notification when the client's account dips below this threshold")
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
//                        Text("Version 0.1.1")
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
