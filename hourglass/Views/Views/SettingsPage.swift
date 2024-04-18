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
                Text("setting1")
                Text("setting2")
            }
        })
    }
}

#Preview {
    ContentView(selectedTab: "SettingsPage")
}
