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
    var editedTimestamp: Date

    init(running: Bool, 
         startTime: Date,
         endTime: Date? = nil,
         secondsElapsed: Int? = nil,
         editedTimestamp: Date) {
        self.running = running
        self.startTime = startTime
        self.endTime = endTime
        self.secondsElapsed = secondsElapsed
        self.editedTimestamp = editedTimestamp
    }

    static let sampleData = [
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 734955053),
                endTime: Date(timeIntervalSinceReferenceDate: 734960633),
                secondsElapsed: 5580,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 735159457)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 734964053),
                endTime: Date(timeIntervalSinceReferenceDate: 734973753),
                secondsElapsed: 9700,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 735159457)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 734974943),
                endTime: Date(timeIntervalSinceReferenceDate: 734977943),
                secondsElapsed: 3000,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 735159457)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 735020752),
                endTime: Date(timeIntervalSinceReferenceDate: 735025452),
                secondsElapsed: 4700,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 735159457)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 735111032),
                endTime: Date(timeIntervalSinceReferenceDate: 735112312),
                secondsElapsed: 1280,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 735159457)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 735122330),
                endTime: Date(timeIntervalSinceReferenceDate: 735131306),
                secondsElapsed: 8976,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 735159457)),

        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 735143330),
                endTime: Date(timeIntervalSinceReferenceDate: 735153030),
                secondsElapsed: 9700,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 736260000)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 735166220),
                endTime: Date(timeIntervalSinceReferenceDate: 735169220),
                secondsElapsed: 3000,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 736260000)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 735224029),
                endTime: Date(timeIntervalSinceReferenceDate: 735228729),
                secondsElapsed: 4700,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 736260000)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 735326309),
                endTime: Date(timeIntervalSinceReferenceDate: 735327589),
                secondsElapsed: 1280,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 736260000)),
        Session(running: false,
                startTime: Date(timeIntervalSinceReferenceDate: 735349607),
                endTime: Date(timeIntervalSinceReferenceDate: 735358583),
                secondsElapsed: 8976,
                editedTimestamp: Date(timeIntervalSinceReferenceDate: 736260000)),
    ]
}
