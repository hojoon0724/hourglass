//
//  SampleData.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/16/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    // static makes it part of the class, not instances
    static let shared = SampleData()

    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }

    // private makes the creation only possible inside the class. avoids confusion
    private init() {
        let schema = Schema([
            Time.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()

        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    func insertSampleData() {
        for time in Time.sampleData {
            context.insert(time)
            print(time.running)
            print(time.startTime)
            print(time.endTime)
            print(time.secondsElapsed)
        }

        do {
            try context.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }

    var time: Time {
        Time.sampleData[0]
    }
}
