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
            Timer()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
                .tag("Timer")

            Projects()
                .tabItem {
                    Label("Projects", systemImage: "folder.fill")
                }
                .tag("Projects")

            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag("Settings")
        }
    }
}

#Preview {
    ContentView()
//    .modelContainer(for: Item.self, inMemory: true)
}
