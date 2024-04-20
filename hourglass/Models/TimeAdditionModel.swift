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
    var id: UUID
    var timeStamp: Date
    var timeAdded: Int
    var rate: Int?
    var client: Client?

    init(id: UUID = UUID(), timeStamp: Date, timeAdded: Int, rate: Int? = nil, client: Client? = nil) {
        self.id = id
        self.timeStamp = timeStamp
        self.timeAdded = timeAdded
        self.rate = rate
        self.client = client
    }

    static let sampleData = [
        TimeAddition(timeStamp: Date(timeIntervalSinceReferenceDate: 735326390), timeAdded: 64800),
        TimeAddition(timeStamp: Date(timeIntervalSinceReferenceDate: 735326390), timeAdded: 43200),
        TimeAddition(timeStamp: Date(timeIntervalSinceReferenceDate: 735326390), timeAdded: 28800),
        TimeAddition(timeStamp: Date(timeIntervalSinceReferenceDate: 735326390), timeAdded: 50400),
        TimeAddition(timeStamp: Date(timeIntervalSinceReferenceDate: 735326357), timeAdded: 14000),
    ]
}
