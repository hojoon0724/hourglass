//
//  testTimerLogData.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import Foundation

struct TestSessionModel {
    let id = UUID()

    let description: String

    let projectName: String
    let clientName: String

    let startTime: Date
    let endTime: Date
    let seconds: Int

    let editedTime: Date
}
