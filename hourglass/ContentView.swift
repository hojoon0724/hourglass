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
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TimerPage()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
                .tag("TimerPage")

//            ProjectsPage()
//                .tabItem {
//                    Label("Projects", systemImage: "folder.fill")
//                }
//                .tag("ProjectsPage")

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
        .modelContainer(SampleData.shared.modelContainer)
}
