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

    @Environment(\.modelContext) private var modelContext

    var body: some View {
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
        // runs function and returns the ColorScheme
        // colorSchemeManager => class
        // getPreferredColorScheme => function to get value
        .preferredColorScheme(colorSchemeManager.getPreferredColorScheme())
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
