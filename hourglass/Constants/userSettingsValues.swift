//
//  userSettingsValues.swift
//  Hourglass
//
//  Created by Hojoon Kim on 5/1/24.
//

import Foundation
import SwiftUI

class UserSettingsValues: ObservableObject {
    static let shared = UserSettingsValues()
    @AppStorage("switchAlert1") var switchAlert1: Bool = false
    @AppStorage("firstAlertThreshold") var firstAlertThreshold: Int = 7200

    @AppStorage("switchAlert2") var switchAlert2: Bool = false
    @AppStorage("secondAlertThreshold") var secondAlertThreshold: Int = 3600

    private init() {}
}
