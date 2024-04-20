//
//  addClientForm.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/19/24.
//

import SwiftUI

struct addClientForm: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var newClient: Client = Client(name: "", color: "")
    @State var newTimeAddition: TimeAddition = TimeAddition(timeStamp: .now, timeAdded: 0)
    @State var hours: Int = 0
    @State var minutes: Int = 0

    @State var clientColor = Color.gray

    @State var timeInSec: Int = 0

    var body: some View {
//        VStack {
//            HStack(content: {
//                Text("New Client")
//                    .padding()
//                Spacer()
//            })
//            .font(.largeTitle)
//            .fontWeight(.bold)
//            .multilineTextAlignment(.leading)

        Form {
            Section(header: Text("Client")) {
                HStack(alignment: .center, content: {
                    Text("Name")
                    TextField("Required", text: $newClient.name, prompt: Text("Required"))
                        .multilineTextAlignment(.trailing)
                })
            }

            Section(header: Text("Initial Time")) {
                HStack(alignment: .center, content: {
                    Text("Hours")
                    TextField("Required", value: $hours, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                })
                HStack(alignment: .center, content: {
                    Text("Minutes")
                    TextField("Required", value: $minutes, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                })
            }
        }
        .navigationTitle("New Client")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add") {
                    newTimeAddition.timeAdded = fullTimeToSeconds(hours, minutes, 0)
                    modelContext.insert(newClient)
                    modelContext.insert(newTimeAddition)
                    newClient.timeAdditions.append(newTimeAddition)
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }

//                Section(header: Text("Color")) {
//                    VStack {
//                        ColorPicker("Choose a color", selection: $clientColor)
//                            .onTapGesture {
//                                print(color)
//                            }
//                            .onChange(of: color, {
//                                print(color)
//                            })
//                    }
//                }
//                Button("Add Client", action: {
//                    newTimeAddition.timeAdded = fullTimeToSeconds(hours, minutes, 0)
//                    modelContext.insert(newClient)
//                    modelContext.insert(newTimeAddition)
//                    newClient.timeAdditions.append(newTimeAddition)
//                    dismiss()
//                })
    }
}

#Preview {
    NavigationStack {
        addClientForm()
            .modelContainer(SampleData.shared.modelContainer)
    }
}
