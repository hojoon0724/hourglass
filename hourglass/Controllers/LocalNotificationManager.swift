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
class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()

    // CHANGE TO FALSE WHEN SHIPPING
    @Published var isGranted = true
//    @Published var isGranted = false
    @Published var requests: [UNNotificationRequest] = []

    override init() {
        super.init()
        notificationCenter.delegate = self
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        await getRequests()
        return [.banner, .sound]
    }

    // req auth
    func requestAuth() async throws {
        try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
        await getCurrentSettings()
    }

    // get status
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = (currentSettings.authorizationStatus == .authorized)
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

    func schedule(localNotification: LocalNotification) async {
        let content = UNMutableNotificationContent()
        content.title = localNotification.title
        content.body = localNotification.body
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: localNotification.timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: localNotification.identifier, content: content, trigger: trigger)
        try? await notificationCenter.add(request)
        await getRequests()
    }

    func getRequests() async {
        requests = await notificationCenter.pendingNotificationRequests()
        print("pending \(requests.count) \n \(requests)")
    }

    func removeRequest() {
        print("pending \(requests.count) \n \(requests)")
        notificationCenter.removeAllPendingNotificationRequests()
        requests.removeAll()
        print("pending \(requests.count) \n \(requests)")
    }
}
