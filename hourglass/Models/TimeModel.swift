//
//  timeModel.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/16/24.
//

import Foundation
import SwiftData

@Model
final class Time {
    var running: Bool
    var startTime: Date
    var endTime: Date?
    var secondsElapsed: Int?

    init(running: Bool, startTime: Date, endTime: Date? = nil, secondsElapsed: Int? = nil) {
        self.running = running
//        print(self.running)
        self.startTime = startTime
//        print(self.startTime)
        self.endTime = endTime
//        print(self.endTime)
        self.secondsElapsed = secondsElapsed
//        print(self.secondsElapsed)
    }

    static let sampleData = [
        Time(running: false, startTime: Date(timeIntervalSinceReferenceDate: 734955053), endTime: Date(timeIntervalSinceReferenceDate: 734960633), secondsElapsed: 5580),
    ]
}
