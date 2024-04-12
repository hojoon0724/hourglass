//
//  ContentView.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State var selectedTab = "Timer"

    var body: some View {
        TabView(selection: $selectedTab) {
            TimerPage(timerClass: timerClass())
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
                .tag("TimerPage")

            ProjectsPage()
                .tabItem {
                    Label("Projects", systemImage: "folder.fill")
                }
                .tag("ProjectsPage")

            ClientsPage()
                .tabItem {
                    Label("Clients", systemImage: "building.2.fill")
                }
                .tag("ClientsPage")

            SettingsPage()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag("SettingsPage")
        }
    }
}

#Preview {
    ContentView()
//    .modelContainer(for: Item.self, inMemory: true)
}
