//
//  ContentView.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State var selectedTab = "TimerPage"
    @StateObject private var colorSchemeManager = ColorSchemeManager.shared
    @StateObject private var userSettingsValues = UserSettingsValues.shared

    @EnvironmentObject var localNotifications: LocalNotificationsManager
    @Environment(\.scenePhase) var scenePhase

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack {
            if localNotifications.isGranted {
                TabView(selection: $selectedTab) {
                    TimerPage()
                        .tabItem { Label("Timer", systemImage: "timer") }
                        .tag("TimerPage")

                    ClientsPage()
                        .tabItem { Label("Clients", systemImage: "building.2.fill") }
                        .tag("ClientsPage")

                    SettingsPage()
                        .tabItem { Label("Settings", systemImage: "gear") }
                        .tag("SettingsPage")
                }
            } else {
                Image("Hourglass BG")
                    .ignoresSafeArea()
                Rectangle()
                    .foregroundColor(.black)
                    .blendMode(colorScheme == .dark ? .darken : .normal)
                    .opacity(colorScheme == .dark ? 0.5 : 0)

                VStack {
                    Text("It's a timer, yo. \nYou need to enable notifications.")
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.title3)
                        .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/)
                    GroupBox {
                        Button("Enable Notifications") {
                            print(localNotifications.isGranted)
                            localNotifications.openSettings()
                        }
                        .buttonBorderShape(.capsule)
                    }
                    .cornerRadius(/*@START_MENU_TOKEN@*/16.0/*@END_MENU_TOKEN@*/)
                    .padding()
                }
            }
        }
        // runs function and returns the ColorScheme
        // colorSchemeManager => class
        // getPreferredColorScheme => function to get value
        .preferredColorScheme(colorSchemeManager.getPreferredColorScheme())
        .task {
            try? await localNotifications.requestAuth()
        }
        .onChange(of: scenePhase) { _, newValue in
            if newValue == .active {
                Task {
                    await localNotifications.getCurrentSettings()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LocalNotificationsManager())
        .modelContainer(SampleData.shared.modelContainer)
}
