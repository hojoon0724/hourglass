//
//  ColorSchemeManager.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/30/24.
//

import SwiftUI

// Create a globally observable class (singleton)
class ColorSchemeManager: ObservableObject {
    // "shared" makes all called instances consistent
    static let shared = ColorSchemeManager()
    @AppStorage("colorScheme") var selectedColorScheme: String = "Auto"

    // checks colorScheme String and returns matching ColorScheme value
    func getPreferredColorScheme() -> ColorScheme? {
        switch selectedColorScheme {
        case "Auto":
            return nil
        case "Light":
            return .light
        case "Dark":
            return .dark
        default:
            return nil
        }
    }
}
