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
    let color: String
    var time: Int
    var sessions = [Session]()

    init(id: UUID = UUID(), name: String, color: String, time: Int) {
        self.id = id
        self.name = name
        self.color = color
        self.time = time
    }

    static let sampleData = [
        Client(
            id: UUID(uuidString: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18")!,
            name: "Digital Dynamics",
            color: "000000",
            time: 64800
        ),
        Client(
            id: UUID(uuidString: "21A5BC17-6843-495F-A73C-AD3E4B95CF96")!,
            name: "GlobalTech Enterprises",
            color: "000000",
            time: 43200
        ),
        Client(
            id: UUID(uuidString: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B")!,
            name: "InnovateX Solutions",
            color: "000000",
            time: 28800
        ),
        Client(
            id: UUID(uuidString: "9245B764-725C-4911-8F7F-FBB9A107EBC9")!,
            name: "SmartTech Solutions",
            color: "000000",
            time: 50400
        ),
        Client(
            id: UUID(uuidString: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57")!,
            name: "TechSolutions",
            color: "000000",
            time: 36000
        ),
    ]
}

extension Client: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Client(id: \(id), name: \(name), color: \(color), time: \(time), sessions: \(sessions))"
    }
}
