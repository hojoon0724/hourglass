//
//  Settings.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        VStack(content: {
            HStack(content: {
                Text("Settings")
                    .padding()
                Spacer()
            })
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            List {
                Section {
//                    NavigationLink {
                    Text("Notification")
                    HStack {
                        Text("Alert below")
                        Spacer()
                        Text("02:00:00")
                            .monospaced()
                    }
//                    }
                } header: {
                    Text("Not functional yet")
                }

                Section {
                    Button(action: {
                        EmailController.shared.sendEmail(subject: "Hourglass Feedback", body: "", to: "hojoon.kim@iCloud.com")
                    }) {
                        Text("Email Feedback")
                    }
                } header: {
                    Text("Feedback")
                } footer: {
                    Text("Help me make it better! \nSend me your feature requests or bug reports anytime")
                }

                Section {
                } footer: {
                    HStack {
                        Spacer()
                        Text("Version 0.1")
                            .font(.subheadline)
                        Spacer()
                    }
                }
            }
            .listStyle(.grouped)
        })
    }
}

#Preview {
    ContentView(selectedTab: "SettingsPage")
}
