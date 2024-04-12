//
//  showProject.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct showProject: View {
    @State private var selectedFlavor: Flavor = .chocolate

    @State var projectName: String
    @State var projectClientName: String
    @State var projectColor: Color

    var project: Project
    init(project: Project) {
        self.project = project
        _projectName = State(initialValue: project.name)
        _projectClientName = State(initialValue: project.clientName)
        _projectColor = State(initialValue: Color(project.color))
    }

    var body: some View {
        VStack(spacing: 0, content: {
//            HStack {
//                Spacer()
//
//                VStack(alignment: .center, content: {
//                    Text(project.name)
//                        .font(.title)
//                    Text(project.clientName)
//                        .font(.caption)
//                })
//
//                Spacer()
//            }
//            .padding()
//            .background(project.color)

            Form {
                Section(header: Text("Project")) {
                    HStack(alignment: .center, content: {
                        Text("Name")
                        TextField("Required", text: $projectName, prompt: Text("Required"))
                            .multilineTextAlignment(.trailing)
                    })

                    Picker("Client", selection: $selectedFlavor) {
                        ForEach(allClients) { client in
                            Text(client.name)
                        }
                    }
                    .pickerStyle(.automatic)

                }

                Section(header: Text("Color")) {
                    VStack {
                        ColorPicker("Color", selection: $projectColor)
                    }
                }
                Button("Save", action: {
                    print("Submitted", project.name, project.clientName, project.color)
                })
            }

            .onAppear {
                print(project)
            }
        })
    }
}

#Preview {
    showProject(project: allProjects[1])
}
