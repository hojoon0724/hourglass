//
//  testData.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import Foundation
import SwiftUI

struct Project {
    let id = UUID()
    let name: String
    let color: Color
    let clientName: String
}

struct Client {
    let id = UUID()
    let name: String
    let time: Int
}

let allClients: [Client] = [
    Client(
        name: "TechSolutions",
        time: 36000
    ),
    Client(
        name: "GlobalTech Enterprises",
        time: 43200
    ),
    Client(
        name: "InnovateX Solutions",
        time: 28800
    ),
    Client(
        name: "SmartTech Solutions",
        time: 50400
    ),
    Client(
        name: "Digital Dynamics",
        time: 64800
    ),
    Client(
        name: "CyberTech Innovations",
        time: 57600
    ),
    Client(
        name: "TechMinds Solutions",
        time: 72000
    ),
    Client(
        name: "DataDriven Technologies",
        time: 57600
    ),
    Client(
        name: "Global Innovations Group",
        time: 46800
    ),
    Client(
        name: "AgileTech Solutions",
        time: 64800
    ),
]

let allProjects: [Project] = [
    Project(
        name: "Phoenix",
        color: .red,
        clientName: "TechSolutions"
    ),
    Project(
        name: "Neptune",
        color: .blue,
        clientName: "TechSolutions"
    ),
    Project(
        name: "Spectre",
        color: .green,
        clientName: "TechSolutions"
    ),
    Project(
        name: "Vortex",
        color: .purple,
        clientName: "TechSolutions"
    ),
    Project(
        name: "Luminary",
        color: .orange,
        clientName: "TechSolutions"
    ),
    Project(
        name: "Quantum",
        color: .cyan,
        clientName: "GlobalTech Enterprises"
    ),
    Project(
        name: "Nebula",
        color: .purple,
        clientName: "GlobalTech Enterprises"
    ),
    Project(
        name: "Eclipse",
        color: .yellow,
        clientName: "GlobalTech Enterprises"
    ),
    Project(
        name: "Aurora",
        color: .teal,
        clientName: "GlobalTech Enterprises"
    ),
    Project(
        name: "Nucleus",
        color: .indigo,
        clientName: "GlobalTech Enterprises"
    ),
    Project(
        name: "Velocity",
        color: .red,
        clientName: "InnovateX Solutions"
    ),
    Project(
        name: "Apex",
        color: .blue,
        clientName: "InnovateX Solutions"
    ),
    Project(
        name: "Sentinel",
        color: .green,
        clientName: "InnovateX Solutions"
    ),
    Project(
        name: "Pulse",
        color: .purple,
        clientName: "InnovateX Solutions"
    ),
    Project(
        name: "Synapse",
        color: .orange,
        clientName: "InnovateX Solutions"
    ),
    Project(
        name: "Zenith",
        color: .cyan,
        clientName: "SmartTech Solutions"
    ),
    Project(
        name: "Matrix",
        color: .yellow,
        clientName: "SmartTech Solutions"
    ),
    Project(
        name: "Cosmos",
        color: .yellow,
        clientName: "SmartTech Solutions"
    ),
    Project(
        name: "Equinox",
        color: .teal,
        clientName: "SmartTech Solutions"
    ),
    Project(
        name: "Oracle",
        color: .indigo,
        clientName: "SmartTech Solutions"
    ),
    Project(
        name: "Aether",
        color: .red,
        clientName: "Digital Dynamics"
    ),
    Project(
        name: "Fusion",
        color: .blue,
        clientName: "Digital Dynamics"
    ),
    Project(
        name: "Voyager",
        color: .green,
        clientName: "Digital Dynamics"
    ),
    Project(
        name: "Nimbus",
        color: .purple,
        clientName: "Digital Dynamics"
    ),
    Project(
        name: "Infinity",
        color: .orange,
        clientName: "Digital Dynamics"
    ),
    Project(
        name: "Titan",
        color: .cyan,
        clientName: "CyberTech Innovations"
    ),
    Project(
        name: "Genesis",
        color: .purple,
        clientName: "CyberTech Innovations"
    ),
    Project(
        name: "Synergy",
        color: .yellow,
        clientName: "CyberTech Innovations"
    ),
    Project(
        name: "Nova",
        color: .teal,
        clientName: "CyberTech Innovations"
    ),
    Project(
        name: "Chronos",
        color: .indigo,
        clientName: "CyberTech Innovations"
    ),
    Project(
        name: "Elysium",
        color: .red,
        clientName: "TechMinds Solutions"
    ),
    Project(
        name: "Astral",
        color: .blue,
        clientName: "TechMinds Solutions"
    ),
    Project(
        name: "Helix",
        color: .green,
        clientName: "TechMinds Solutions"
    ),
    Project(
        name: "Zen",
        color: .purple,
        clientName: "TechMinds Solutions"
    ),
    Project(
        name: "Vivid",
        color: .orange,
        clientName: "TechMinds Solutions"
    ),
    Project(
        name: "Quantum",
        color: .cyan,
        clientName: "DataDriven Technologies"
    ),
    Project(
        name: "Nebula",
        color: .purple,
        clientName: "DataDriven Technologies"
    ),
    Project(
        name: "Eclipse",
        color: .yellow,
        clientName: "DataDriven Technologies"
    ),
    Project(
        name: "Aurora",
        color: .teal,
        clientName: "DataDriven Technologies"
    ),
    Project(
        name: "Nucleus",
        color: .indigo,
        clientName: "DataDriven Technologies"
    ),
    Project(
        name: "Velocity",
        color: .red,
        clientName: "Global Innovations Group"
    ),
    Project(
        name: "Apex",
        color: .blue,
        clientName: "Global Innovations Group"
    ),
    Project(
        name: "Sentinel",
        color: .green,
        clientName: "Global Innovations Group"
    ),
    Project(
        name: "Pulse",
        color: .purple,
        clientName: "Global Innovations Group"
    ),
    Project(
        name: "Synapse",
        color: .orange,
        clientName: "Global Innovations Group"
    ),
    Project(
        name: "Zenith",
        color: .cyan,
        clientName: "AgileTech Solutions"
    ),
    Project(
        name: "Matrix",
        color: .purple,
        clientName: "AgileTech Solutions"
    ),
    Project(
        name: "Cosmos",
        color: .yellow,
        clientName: "AgileTech Solutions"
    ),
    Project(
        name: "Equinox",
        color: .teal,
        clientName: "AgileTech Solutions"
    ),
    Project(
        name: "Oracle",
        color: .indigo,
        clientName: "AgileTech Solutions"
    ),
]

extension Client: Identifiable {}
extension Project: Identifiable {}
