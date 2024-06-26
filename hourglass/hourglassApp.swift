//
//  hourglassApp.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftData
import SwiftUI

@main
struct hourglassApp: App {
    @StateObject var localNotifications = LocalNotificationManager()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Session.self,
            Client.self,
            TimeAddition.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView()
                .environmentObject(localNotifications)
        }
        .defaultSize(CGSize(width: 600, height: 1000))
        .modelContainer(sharedModelContainer)
    }
}
