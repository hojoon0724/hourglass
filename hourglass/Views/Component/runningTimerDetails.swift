//
//  runningTimerDetails.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import SwiftUI

struct runningTimerDetails: View {
    @State private var showingAlert = false

    @State var description: String = ""

    @State var projectName: String = ""
    @State var addMinutes: String = ""

    @State var projectColor = Color.gray

    var body: some View {
        VStack {
            HStack(content: {
                Text("Details")
                    .padding()
                Spacer()
            })
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)

            Form {
                Section(header: Text("Project")) {
                    HStack(alignment: .center, content: {
                        Text("Description")
                        TextField("", text: $description)
                            .multilineTextAlignment(.trailing)
                    })
                }
                Section(header: Text("")) {
                    
                    HStack(alignment: .center, content: {
                        Text("Client")
                        TextField("", text: $addMinutes)
                            .multilineTextAlignment(.trailing)
                    })
                    
                    HStack(alignment: .center, content: {
                        Text("Project")
                        TextField("", text: $projectName)
                            .multilineTextAlignment(.trailing)
                    })
                }

                Section(header: Text("Color")) {
                    VStack {
                        ColorPicker("Color", selection: $projectColor)
                    }
                }
                Button("Save", action: {
                    print("Submitted", description, projectName, addMinutes, projectColor)
                  if(description==""){
                    
                    showingAlert = true
                  }
                })
                .alert("Important message", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
    }
}

#Preview {
    runningTimerDetails()
}
