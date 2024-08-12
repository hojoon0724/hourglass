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
    @StateObject var csManager: ColorSchemeManager

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

    init() {
        _csManager = StateObject(wrappedValue: ColorSchemeManager())
    }

    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView()
                .environmentObject(csManager)
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    csManager.applyColorScheme()
                }
                .environmentObject(localNotifications)
        }
        .modelContainer(sharedModelContainer)
        #if os(visionOS)
            .defaultSize(width: 0.5, height: 0.5, depth: 0.1, in: .meters)
        #endif
    }
}
