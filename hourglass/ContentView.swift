//
//  ContentView.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Timer()
        .tabItem {
          Label("Timer", systemImage: "timer")
        }
      Projects()
        .tabItem {
          Label("Projects", systemImage: "folder.fill")
        }
      Settings()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
