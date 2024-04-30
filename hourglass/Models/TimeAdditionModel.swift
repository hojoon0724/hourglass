//
//  TimeAdditionModel.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/20/24.
//

import Foundation
import SwiftData

@Model
final class TimeAddition {
//    var timeCreated: Date
    var timeStamp: Date
    var timeAdded: Int
    var rate: Double?
    var client: Client?

    init( /* timeCreated: Date? = .now, */ timeStamp: Date, timeAdded: Int, rate: Double? = nil, client: Client? = nil) {
//        self.timeCreated = timeCreated ?? .now
        self.timeStamp = timeStamp
        self.timeAdded = timeAdded
        self.rate = rate
        self.client = client
    }

    static let sampleData = [
        TimeAddition(
//            timeCreated: Date(timeIntervalSinceReferenceDate: 735326390),
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326390),
            timeAdded: 64900),
        TimeAddition(
//            timeCreated: Date(timeIntervalSinceReferenceDate: 735326390),
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326390),
            timeAdded: 43400),
        TimeAddition(
//            timeCreated: Date(timeIntervalSinceReferenceDate: 735326390),
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326390),
            timeAdded: 8481),
        TimeAddition(
//            timeCreated: Date(timeIntervalSinceReferenceDate: 735326390),
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326390),
            timeAdded: 7200),
        TimeAddition(
//            timeCreated: Date(timeIntervalSinceReferenceDate: 735326357),
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326357),
            timeAdded: 3600),
    ]
}
