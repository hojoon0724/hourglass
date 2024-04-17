//
//  testData.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import Foundation
import SwiftUI

struct TestProject: Identifiable, Hashable {
//    let id = UUID()
    let id: String
    let name: String
    let color: Color
    let clientName: String
    let clientId: String
}

struct TestClient: Identifiable, Hashable {
//    let id = UUID()
    let id: String
    let name: String
    let time: Int
}

let allTestClients: [TestClient] = [
    TestClient(
        id: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57",
        name: "TechSolutions",
        time: 36000
    ),
    TestClient(
        id: "21A5BC17-6843-495F-A73C-AD3E4B95CF96",
        name: "GlobalTech Enterprises",
        time: 43200
    ),
    TestClient(
        id: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B",
        name: "InnovateX Solutions",
        time: 28800
    ),
    TestClient(
        id: "9245B764-725C-4911-8F7F-FBB9A107EBC9",
        name: "SmartTech Solutions",
        time: 50400
    ),
    TestClient(
        id: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18",
        name: "Digital Dynamics",
        time: 64800
    ),
    TestClient(
        id: "92E2E37F-26C2-4498-B470-42AC33DBE033",
        name: "CyberTech Innovations",
        time: 57600
    ),
    TestClient(
        id: "5C5E809A-7D56-4DB0-A1B3-DFE15A462BD0",
        name: "TechMinds Solutions",
        time: 72000
    ),
    TestClient(
        id: "FE5BDF85-FB54-4A25-BF9D-50E0A6754CB9",
        name: "DataDriven Technologies",
        time: 57600
    ),
    TestClient(
        id: "6A2B22D3-37EB-42E1-A6E7-BB332D68C845",
        name: "Global Innovations Group",
        time: 46800
    ),
    TestClient(
        id: "FF1BCE2D-0AA3-4F37-BA64-DC01A5BB672C",
        name: "AgileTech Solutions",
        time: 64800
    ),
]

let allTestProjects: [TestProject] = [
    TestProject(
        id: "57C44EC4-54F2-4D2D-8697-149C5EF0D469",
        name: "Phoenix",
        color: .red,
        clientName: "TechSolutions",
        clientId: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57"
    ),
    TestProject(
        id: "1E00D41C-6844-4E42-B274-EB86E941FB8E",
        name: "Neptune",
        color: .blue,
        clientName: "TechSolutions",
        clientId: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57"
    ),
    TestProject(
        id: "E2F1D431-E5A5-4735-89EB-61994F4CBE8B",
        name: "Spectre",
        color: .green,
        clientName: "TechSolutions",
        clientId: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57"
    ),
    TestProject(
        id: "51D454A4-B145-4D7F-94B3-99266C618229",
        name: "Vortex",
        color: .purple,
        clientName: "TechSolutions",
        clientId: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57"
    ),
    TestProject(
        id: "FE40DB63-25E3-493C-B15C-12A28F399C2E",
        name: "Luminary",
        color: .orange,
        clientName: "TechSolutions",
        clientId: "E893AF78-7C9C-4417-A1DC-F97B82DD7A57"
    ),
    TestProject(
        id: "C9A808C1-93E5-4EDF-9AB0-1D46FE00B9F7",
        name: "Quantum",
        color: .cyan,
        clientName: "GlobalTech Enterprises",
        clientId: "21A5BC17-6843-495F-A73C-AD3E4B95CF96"
    ),
    TestProject(
        id: "A80EE8AC-3F7B-409F-94E4-58E3FA6223B4",
        name: "Nebula",
        color: .purple,
        clientName: "GlobalTech Enterprises",
        clientId: "21A5BC17-6843-495F-A73C-AD3E4B95CF96"
    ),
    TestProject(
        id: "872AC0E5-B61C-4B26-8722-FA0E430AB37C",
        name: "Eclipse",
        color: .yellow,
        clientName: "GlobalTech Enterprises",
        clientId: "21A5BC17-6843-495F-A73C-AD3E4B95CF96"
    ),
    TestProject(
        id: "1A4D4393-1D5A-4F06-8E12-6815D764E39B",
        name: "Aurora",
        color: .teal,
        clientName: "GlobalTech Enterprises",
        clientId: "21A5BC17-6843-495F-A73C-AD3E4B95CF96"
    ),
    TestProject(
        id: "EC82E4D9-4CE5-4867-B4E5-6E9B3DFC4D06",
        name: "Nucleus",
        color: .indigo,
        clientName: "GlobalTech Enterprises",
        clientId: "21A5BC17-6843-495F-A73C-AD3E4B95CF96"
    ),
    TestProject(
        id: "520A67B8-43F4-4619-9C30-C81F1CFC0BCF",
        name: "Velocity",
        color: .red,
        clientName: "InnovateX Solutions",
        clientId: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B"
    ),
    TestProject(
        id: "124E4C07-1390-4328-9EC6-5BBD89438A21",
        name: "Apex",
        color: .blue,
        clientName: "InnovateX Solutions",
        clientId: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B"
    ),
    TestProject(
        id: "BB28CE8B-DC40-4FCA-903D-C01C0AF7FA93",
        name: "Sentinel",
        color: .green,
        clientName: "InnovateX Solutions",
        clientId: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B"
    ),
    TestProject(
        id: "BBC5F1B0-426E-4E5F-815C-DA64A5CCE4AC",
        name: "Pulse",
        color: .purple,
        clientName: "InnovateX Solutions",
        clientId: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B"
    ),
    TestProject(
        id: "4E1A7C6D-3A53-4D5F-A1E7-B265890C1AA7",
        name: "Synapse",
        color: .orange,
        clientName: "InnovateX Solutions",
        clientId: "F219D5ED-1C59-40E5-B243-4B6A16B8F36B"
    ),
    TestProject(
        id: "B02FAA48-6AB7-4FDD-A4C0-0F457B29F6A5",
        name: "Zenith",
        color: .cyan,
        clientName: "SmartTech Solutions",
        clientId: "9245B764-725C-4911-8F7F-FBB9A107EBC9"
    ),
    TestProject(
        id: "9E5D92F5-F5DB-4605-9A2B-7E6CFEAEF0C4",
        name: "Matrix",
        color: .yellow,
        clientName: "SmartTech Solutions",
        clientId: "9245B764-725C-4911-8F7F-FBB9A107EBC9"
    ),
    TestProject(
        id: "E421A9ED-00F5-46C1-8AF6-3B4B6759ECD2",
        name: "Cosmos",
        color: .yellow,
        clientName: "SmartTech Solutions",
        clientId: "9245B764-725C-4911-8F7F-FBB9A107EBC9"
    ),
    TestProject(
        id: "94756457-66C2-42BB-A55E-DF29F36D2885",
        name: "Equinox",
        color: .teal,
        clientName: "SmartTech Solutions",
        clientId: "9245B764-725C-4911-8F7F-FBB9A107EBC9"
    ),
    TestProject(
        id: "D05D67DD-9F47-44F8-ADBB-F2FBC4C8D5A1",
        name: "Oracle",
        color: .indigo,
        clientName: "SmartTech Solutions",
        clientId: "9245B764-725C-4911-8F7F-FBB9A107EBC9"
    ),
    TestProject(
        id: "52CBE2C1-27C3-4241-A0C2-19A3FF1809D8",
        name: "Aether",
        color: .red,
        clientName: "Digital Dynamics",
        clientId: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18"
    ),
    TestProject(
        id: "A8776AC9-CA9B-4F6E-9E88-D3E1D647591C",
        name: "Fusion",
        color: .blue,
        clientName: "Digital Dynamics",
        clientId: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18"
    ),
    TestProject(
        id: "D800D1D7-FF15-4713-B24D-2354D10FFAE8",
        name: "Voyager",
        color: .green,
        clientName: "Digital Dynamics",
        clientId: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18"
    ),
    TestProject(
        id: "E861A7BB-19DB-4055-B4F4-5BB6A73B3B37",
        name: "Nimbus",
        color: .purple,
        clientName: "Digital Dynamics",
        clientId: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18"
    ),
    TestProject(
        id: "FD6BBF94-C9E1-43C3-9184-9FE6EC319320",
        name: "Infinity",
        color: .orange,
        clientName: "Digital Dynamics",
        clientId: "9A45A7C6-B833-4C41-B34D-8DDDDCAB8C18"
    ),
    TestProject(
        id: "B8D542D5-4764-4C07-A0B9-C4EB27383D3E",
        name: "Titan",
        color: .cyan,
        clientName: "CyberTech Innovations",
        clientId: "92E2E37F-26C2-4498-B470-42AC33DBE033"
    ),
    TestProject(
        id: "8C3736E4-7F19-4F30-BA8A-5B42A8052C84",
        name: "Genesis",
        color: .purple,
        clientName: "CyberTech Innovations",
        clientId: "92E2E37F-26C2-4498-B470-42AC33DBE033"
    ),
    TestProject(
        id: "4B0F09CB-5FCE-45E5-B66D-9BCC7740ACFF",
        name: "Synergy",
        color: .yellow,
        clientName: "CyberTech Innovations",
        clientId: "92E2E37F-26C2-4498-B470-42AC33DBE033"
    ),
    TestProject(
        id: "C100C3B4-8C3A-4325-A5AD-32594CBDAE47",
        name: "Nova",
        color: .teal,
        clientName: "CyberTech Innovations",
        clientId: "92E2E37F-26C2-4498-B470-42AC33DBE033"
    ),
    TestProject(
        id: "15A0458E-8450-4427-A2CE-3A282E6DCA54",
        name: "Chronos",
        color: .indigo,
        clientName: "CyberTech Innovations",
        clientId: "92E2E37F-26C2-4498-B470-42AC33DBE033"
    ),
    TestProject(
        id: "B1E3FAEB-21E1-405E-A6ED-06216AF3EF5E",
        name: "Elysium",
        color: .red,
        clientName: "TechMinds Solutions",
        clientId: "5C5E809A-7D56-4DB0-A1B3-DFE15A462BD0"
    ),
    TestProject(
        id: "7C19184F-FF4D-40B0-A0D3-7413DFD2DBE1",
        name: "Astral",
        color: .blue,
        clientName: "TechMinds Solutions",
        clientId: "5C5E809A-7D56-4DB0-A1B3-DFE15A462BD0"
    ),
    TestProject(
        id: "73112A76-8AB1-41B0-8CEA-98268B086EAF",
        name: "Helix",
        color: .green,
        clientName: "TechMinds Solutions",
        clientId: "5C5E809A-7D56-4DB0-A1B3-DFE15A462BD0"
    ),
    TestProject(
        id: "0D156F46-FB06-43D6-8777-09E0A1513C2D",
        name: "Zen",
        color: .purple,
        clientName: "TechMinds Solutions",
        clientId: "5C5E809A-7D56-4DB0-A1B3-DFE15A462BD0"
    ),
    TestProject(
        id: "FB53A954-DC5E-465E-B16E-3A70F5750DA3",
        name: "Vivid",
        color: .orange,
        clientName: "TechMinds Solutions",
        clientId: "5C5E809A-7D56-4DB0-A1B3-DFE15A462BD0"
    ),
    TestProject(
        id: "AF2E05B8-27E5-4A8F-88A4-0A77BBE69E6F",
        name: "Quantum",
        color: .cyan,
        clientName: "DataDriven Technologies",
        clientId: "FE5BDF85-FB54-4A25-BF9D-50E0A6754CB9"
    ),
    TestProject(
        id: "E9C70140-4E9D-4980-A694-0D1C8A09FAF9",
        name: "Nebula",
        color: .purple,
        clientName: "DataDriven Technologies",
        clientId: "FE5BDF85-FB54-4A25-BF9D-50E0A6754CB9"
    ),
    TestProject(
        id: "84A6112A-02FD-4974-85E0-5D2FA062A1E3",
        name: "Eclipse",
        color: .yellow,
        clientName: "DataDriven Technologies",
        clientId: "FE5BDF85-FB54-4A25-BF9D-50E0A6754CB9"
    ),
    TestProject(
        id: "7E1AEB15-50AD-42AC-BE46-C883B4976CA4",
        name: "Aurora",
        color: .teal,
        clientName: "DataDriven Technologies",
        clientId: "FE5BDF85-FB54-4A25-BF9D-50E0A6754CB9"
    ),
    TestProject(
        id: "F97D2E8B-DC7C-48D3-9E3D-5694932A2A5E",
        name: "Nucleus",
        color: .indigo,
        clientName: "DataDriven Technologies",
        clientId: "FE5BDF85-FB54-4A25-BF9D-50E0A6754CB9"
    ),
    TestProject(
        id: "71B184F8-AC47-44A3-9B54-472FAB4DCEBD",
        name: "Velocity",
        color: .red,
        clientName: "Global Innovations Group",
        clientId: "6A2B22D3-37EB-42E1-A6E7-BB332D68C845"
    ),
    TestProject(
        id: "1B75163C-C71E-4C43-9867-4A77A2C00E2C",
        name: "Apex",
        color: .blue,
        clientName: "Global Innovations Group",
        clientId: "6A2B22D3-37EB-42E1-A6E7-BB332D68C845"
    ),
    TestProject(
        id: "FE4F7237-4AA6-49A0-BAB4-AB10577F4711",
        name: "Sentinel",
        color: .green,
        clientName: "Global Innovations Group",
        clientId: "6A2B22D3-37EB-42E1-A6E7-BB332D68C845"
    ),
    TestProject(
        id: "BE7BB531-63AB-4913-B20B-F85736514C38",
        name: "Pulse",
        color: .purple,
        clientName: "Global Innovations Group",
        clientId: "6A2B22D3-37EB-42E1-A6E7-BB332D68C845"
    ),
    TestProject(
        id: "47F5171F-65F2-4053-BD2D-1C5A8CB35D09",
        name: "Synapse",
        color: .orange,
        clientName: "Global Innovations Group",
        clientId: "6A2B22D3-37EB-42E1-A6E7-BB332D68C845"
    ),
    TestProject(
        id: "F08DB31A-5FBB-491A-BC5E-569B8384D65D",
        name: "Zenith",
        color: .cyan,
        clientName: "AgileTech Solutions",
        clientId: "FF1BCE2D-0AA3-4F37-BA64-DC01A5BB672C"
    ),
    TestProject(
        id: "7E35E22C-7453-4D33-91F9-1803A33037A9",
        name: "Matrix",
        color: .purple,
        clientName: "AgileTech Solutions",
        clientId: "FF1BCE2D-0AA3-4F37-BA64-DC01A5BB672C"
    ),
    TestProject(
        id: "68F625D7-FD42-4E2C-8A94-617A32EF8F09",
        name: "Cosmos",
        color: .yellow,
        clientName: "AgileTech Solutions",
        clientId: "FF1BCE2D-0AA3-4F37-BA64-DC01A5BB672C"
    ),
    TestProject(
        id: "8BC1C61D-1345-4C08-AF5F-2D8DE124273B",
        name: "Equinox",
        color: .teal,
        clientName: "AgileTech Solutions",
        clientId: "FF1BCE2D-0AA3-4F37-BA64-DC01A5BB672C"
    ),
    TestProject(
        id: "CBAED104-E972-4A38-876E-826F048E8E23",
        name: "Oracle",
        color: .indigo,
        clientName: "AgileTech Solutions",
        clientId: "FF1BCE2D-0AA3-4F37-BA64-DC01A5BB672C"
    ),
]
