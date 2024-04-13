//
//  addSessionForm.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import SwiftUI

struct addSessionForm: View {
    @State private var selectedClient: Client? = nil

    @State private var id = UUID()

    @State private var description: String = ""

    @State private var projectName: String = ""
    @State private var projectId: String = ""

    @State private var clientName: String = ""
    @State private var clientId: String = ""

    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var seconds: Int = 0

    @State private var editedTime: Date = Date()

    @State private var filteredProjects: Array = []

    var body: some View {
        VStack(alignment: .leading, content: {
            Text("sessionTitle")
                .padding()
            Form {
                Section(header: Text("Project")) {
                    Picker("Client", selection: $clientName) {
                        ForEach(allClients, id: \.name) { client in
                            Text(client.name)
                        }
                    }
                    .onChange(of: clientName) {
                        let filteredClients = allClients.filter { $0.name == clientName }
                        selectedClient = filteredClients[0]
                        print(selectedClient!)
                    }
//                    Picker("Project", selection: $projectName) {
//                        ForEach(allProjects.filter { $0.clientName == clientName }) { project in
//                            Text(project.name)
//                        }
//                    }
//                    .pickerStyle(.automatic)
                }
                Section(header: Text("Time")) {
                    HStack(alignment: .center, content: {
                        Text("Start")
//                        TextField("00:00:00", text: $startTime)
                            .multilineTextAlignment(.trailing)
                    })
                    HStack(alignment: .center, content: {
                        Text("End")
//                        TextField("00:00:00", text: $endTime)
                            .multilineTextAlignment(.trailing)
                    })
                }

                Button("Add Project", action: {
                    print(clientName)
                    print("ClientName: \(clientName)")
                    print("ClientId: \(clientId)")
                    print("projectName \(projectName)")
                    print("projectId \(projectId)")
                    print("startTime \(startTime)")
                })
            }
        })
        .background(Color.blue)
    }
}

#Preview {
    addSessionForm()
}
