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
            Session.self,
            Client.self,
            TimeAddition.self,
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
        for session in Session.sampleData {
            context.insert(session)
        }
        for client in Client.sampleData {
            context.insert(client)
        }
        for timeAddition in TimeAddition.sampleData {
            context.insert(timeAddition)
        }

        Session.sampleData[0].client = Client.sampleData[0]
        Session.sampleData[1].client = Client.sampleData[0]
        Session.sampleData[2].client = Client.sampleData[1]
        Session.sampleData[3].client = Client.sampleData[1]
        Session.sampleData[4].client = Client.sampleData[2]
        Session.sampleData[5].client = Client.sampleData[0]
        Session.sampleData[6].client = Client.sampleData[0]
        Session.sampleData[7].client = Client.sampleData[0]
        Session.sampleData[8].client = Client.sampleData[0]
        Session.sampleData[8].client = Client.sampleData[1]
        Session.sampleData[9].client = Client.sampleData[2]
        Session.sampleData[10].client = Client.sampleData[0]

        TimeAddition.sampleData[0].client = Client.sampleData[0]
        TimeAddition.sampleData[1].client = Client.sampleData[0]
        TimeAddition.sampleData[2].client = Client.sampleData[1]
        TimeAddition.sampleData[3].client = Client.sampleData[3]
        TimeAddition.sampleData[4].client = Client.sampleData[4]
        TimeAddition.sampleData[5].client = Client.sampleData[4]
        TimeAddition.sampleData[6].client = Client.sampleData[3]

        do {
            try context.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }

    var session: Session {
        Session.sampleData[0]
    }

    var client: Client {
        Client.sampleData[0]
    }

    var timeAddition: TimeAddition {
        TimeAddition.sampleData[0]
    }
}
