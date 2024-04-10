//
//  projectAddModal.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/9/24.
//

import SwiftUI

struct projectAddModal: View {
    @State var projectName: String = ""

    @State var addHours: String = ""
    @State var addMinutes: String = ""

    @State var projectColor = Color.gray

    var body: some View {
        VStack {
            HStack(content: {
                Text("New Project")
                    .padding()
                Spacer()
            })
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)

            Form {
                Section(header: Text("Project")) {
                    HStack(alignment: .center, content: {
                        Text("Name")
                        TextField("Required", text: $projectName, prompt: Text("Required"))
                            .multilineTextAlignment(.trailing)
                    })
                }
                Section(header: Text("Time")) {
                    HStack(alignment: .center, content: {
                        Text("Hours")
                        TextField("Required", text: $addHours, prompt: Text("Required"))
                            .multilineTextAlignment(.trailing)
                    })
                    HStack(alignment: .center, content: {
                        Text("Minutes")
                        TextField("Required", text: $addMinutes, prompt: Text("Required"))
                            .multilineTextAlignment(.trailing)
                    })
                }

                Section(header: Text("Color")) {
                    VStack {
                        ColorPicker("Color", selection: $projectColor)
                    }
                }
                Button("Add Project", action: {
                    print("Submitted", projectName, addHours, addMinutes, projectColor)
                })
            }
        }
    }
}

#Preview {
    projectAddModal()
}
