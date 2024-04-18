//
//  SessionModel.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/16/24.
//

import Foundation
import SwiftData

@Model
final class Session {
    var running: Bool
    var startTime: Date
    var endTime: Date?
    var secondsElapsed: Int?
    var client: Client?

    init(running: Bool, startTime: Date, endTime: Date? = nil, secondsElapsed: Int? = nil) {
        self.running = running
        self.startTime = startTime
        self.endTime = endTime
        self.secondsElapsed = secondsElapsed
    }

    func runOnChange() {
        if endTime != nil {
            print("end time is \(endTime!)")
        }
    }

    static let sampleData = [
        Session(running: false, startTime: Date(timeIntervalSinceReferenceDate: 734955053), endTime: Date(timeIntervalSinceReferenceDate: 734960633), secondsElapsed: 5580),
        Session(running: false, startTime: Date(timeIntervalSinceReferenceDate: 734955053), endTime: Date(timeIntervalSinceReferenceDate: 734960633), secondsElapsed: 5580),
        Session(running: false, startTime: Date(timeIntervalSinceReferenceDate: 734964053), endTime: Date(timeIntervalSinceReferenceDate: 734973753), secondsElapsed: 9700),
        Session(running: false, startTime: Date(timeIntervalSinceReferenceDate: 734974943), endTime: Date(timeIntervalSinceReferenceDate: 734977943), secondsElapsed: 3000),
        Session(running: false, startTime: Date(timeIntervalSinceReferenceDate: 735020752), endTime: Date(timeIntervalSinceReferenceDate: 735025452), secondsElapsed: 4700),
        Session(running: false, startTime: Date(timeIntervalSinceReferenceDate: 735111032), endTime: Date(timeIntervalSinceReferenceDate: 735112312), secondsElapsed: 1280),
    ]
}
