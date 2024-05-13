//
//  LocalNotificationsManager.swift
//  Hourglass
//
//  Created by Hojoon Kim on 5/4/24.
//

import Foundation
import UIKit
import UserNotifications

@MainActor
class LocalNotificationsManager: ObservableObject {
    let notificationCenter = UNUserNotificationCenter.current()

    // CHANGE TO FALSE WHEN SHIPPING
    @Published var isGranted = false

    // req auth
    func requestAuth() async throws {
        try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
        await getCurrentSettings()
    }

    // get status
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = (currentSettings.authorizationStatus == .authorized)
        print("isGranted: \(isGranted)")
        print("currentSettings: \(currentSettings.authorizationStatus)")
    }

    // open settings
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
}
