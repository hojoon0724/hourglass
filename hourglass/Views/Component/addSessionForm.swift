//
//  addSessionForm.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import SwiftUI

struct addSessionForm: View {
    @State private var selectedClient: TestClient? = nil

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
                        ForEach(allTestClients, id: \.name) { client in
                            Text(client.name)
                        }
                    }
                    .onChange(of: clientName) {
                        let filteredClients = allTestClients.filter { $0.name == clientName }
                        selectedClient = filteredClients[0]
                        print(selectedClient!)
                        print(allTestProjects.filter { $0.clientName == clientName })
                    }
                    Picker("Project", selection: $projectName) {
                        ForEach(allTestProjects.filter { $0.clientName == clientName }) { project in
                            Text(project.name)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                Section(header: Text("Time")) {
                    HStack(alignment: .center, content: {
                        Text("Start")
                        Spacer()
                        DatePicker("", selection: $startTime)
//                        TextField("00:00:00", text: $startTime)
                            .multilineTextAlignment(.trailing)
                    })
                    HStack(alignment: .center, content: {
                        Text("End")
                        Spacer()
                        DatePicker("", selection: $endTime)
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
                    print(Date())
                })
            }
        })
        .background(Color.blue)
    }
}

#Preview {
    addSessionForm()
}
