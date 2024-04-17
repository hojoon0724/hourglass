//
//  clientModel.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/16/24.
//

import Foundation
import SwiftData

@Model
final class Client {
    var id: UUID
    var name: String
    var time: Int64

    init(id: UUID = UUID(), name: String, time: Int64) {
        self.id = id
        self.name = name
        self.time = time
    }

    static let sampleData = [
        Client(
            id: UUID(uuidString: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57")!,
            name: "TechSolutions",
            time: 36000
        ),
        Client(
            id: UUID(uuidString: "21A5BC17-6843-495F-A73C-AD3E4B95CF96")!,
            name: "GlobalTech Enterprises",
            time: 43200
        ),
        Client(
            id: UUID(uuidString: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B")!,
            name: "InnovateX Solutions",
            time: 28800
        ),
        Client(
            id: UUID(uuidString: "9245B764-725C-4911-8F7F-FBB9A107EBC9")!,
            name: "SmartTech Solutions",
            time: 50400
        ),
        Client(
            id: UUID(uuidString: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18")!,
            name: "Digital Dynamics",
            time: 64800
        ),
    ]
}
