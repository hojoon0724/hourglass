//
//  ColorSchemeManager.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/30/24.
//

import SwiftUI

// Create a globally observable class (singleton)
//class ColorSchemeManager: ObservableObject {
//    // "shared" makes all called instances consistent
//    static let shared = ColorSchemeManager()
//    @AppStorage("colorScheme") var selectedColorScheme: String = "Auto"
//
//    // checks colorScheme String and returns matching ColorScheme value
//    func getPreferredColorScheme() -> ColorScheme? {
//        switch selectedColorScheme {
//        case "Auto":
//            print("Auto")
//            return nil
//        case "Light":
//            print("Light")
//            return .light
//        case "Dark":
//            print("Dark")
//            return .dark
//        default:
//            print("default")
//            return nil
//        }
//    }
//}


enum ColorScheme: Int {
    case unspecified, light, dark
}

class ColorSchemeManager: ObservableObject {
    
    @AppStorage("colorScheme") var colorScheme: ColorScheme = .unspecified {
        didSet {
            applyColorScheme()
        }
    }
    
    func applyColorScheme() {
        keyWindow?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: colorScheme.rawValue)!
    }
    
    var keyWindow: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
            return nil
        }
        return window
    }
}
