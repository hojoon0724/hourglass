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
    var timeStamp: Date
    var timeAdded: Int
    var rate: Double?
    @Relationship var client: Client?

    init(timeStamp: Date,
         timeAdded: Int,
         rate: Double? = nil,
         client: Client? = nil) {
        self.timeStamp = timeStamp
        self.timeAdded = timeAdded
        self.rate = rate
        self.client = client
    }

    static let sampleData = [
        TimeAddition(
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326390),
            timeAdded: 64920),
        TimeAddition(
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326390),
            timeAdded: 43440),
        TimeAddition(
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326390),
            timeAdded: 16020),
        TimeAddition(
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326390),
            timeAdded: 7200),
        TimeAddition(
            timeStamp: Date(timeIntervalSinceReferenceDate: 735326357),
            timeAdded: 3600),
        TimeAddition(
            timeStamp: Date(timeIntervalSinceReferenceDate: 735386390),
            timeAdded: 4320),
        TimeAddition(
            timeStamp: Date(timeIntervalSinceReferenceDate: 735396357),
            timeAdded: 3600),
    ]
}
