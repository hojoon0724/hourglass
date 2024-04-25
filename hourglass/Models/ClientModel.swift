//
//  ClientModel.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/16/24.
//

import Foundation
import SwiftData

@Model
final class Client {
    var id: UUID
    @Attribute(.unique) var name: String
    var color: String

    @Relationship(deleteRule: .cascade) var timeAdditions = [TimeAddition]()
    var timeAdded: Int {
        return timeAdditions.reduce(0) { $0 + ($1.timeAdded) }
    }

    @Relationship(deleteRule: .cascade) var sessions = [Session]()
    var timeUsed: Int {
        return sessions.reduce(0) { $0 + ($1.secondsElapsed ?? 0) }
    }

    init(id: UUID = UUID(), name: String, color: String) {
        self.id = id
        self.name = name
        self.color = color
    }

    static let sampleData = [
        Client(
            id: UUID(uuidString: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18")!,
            name: "Boring Company",
            color: "000000"
        ),
        Client(
            id: UUID(uuidString: "21A5BC17-6843-495F-A73C-AD3E4B95CF96")!,
            name: "HudsonAlpha",
            color: "000000"
        ),
        Client(
            id: UUID(uuidString: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B")!,
            name: "Scuderia Ferrari",
            color: "000000"
        ),
        Client(
            id: UUID(uuidString: "9245B764-725C-4911-8F7F-FBB9A107EBC9")!,
            name: "Syncopy",
            color: "000000"
        ),
        Client(
            id: UUID(uuidString: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57")!,
            name: "NBCUniversal",
            color: "000000"
        ),
    ]
}

extension Client: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Client(id: \(id), name: \(name), color: \(color), time: \(timeAdded), sessions: \(sessions))"
    }
}
