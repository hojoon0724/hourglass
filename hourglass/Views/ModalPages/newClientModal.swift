//
//  newClientModal.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/19/24.
//

import SwiftUI

struct newClientModal: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var newClient: Client = Client(name: "", color: "")
    @State var newTimeAddition: TimeAddition = TimeAddition(timeStamp: .now, timeAdded: 0)
    @State var hours: Double = 0
    @State var minutes: Double = 0

    @State var clientColor = Color.gray

    @State var timeInSec: Int = 0

    @State var confirmationShow = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Time to add")
                    .font(.title3)
                Spacer()
                TextFieldStepper(
                    doubleValue: $hours,
                    unit: "h",
                    label: ""
                )

                TextFieldStepper(
                    doubleValue: $minutes,
                    unit: "m",
                    label: "",
                    maximum: 59
                )
            }
            .padding()
        }
        List {
            Section(header: Text("Client")) {
                HStack(alignment: .center, content: {
                    Text("Name")
                    TextField("Required", text: $newClient.name, prompt: Text("Required"))
                        .multilineTextAlignment(.trailing)
                        .textInputAutocapitalization(.words)
                })
            }
        }
        .listStyle(.grouped)
        .navigationTitle("New Client")

        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add") {
                    newTimeAddition.timeAdded = fullTimeToSeconds(Int(hours), Int(minutes), 0)
                    modelContext.insert(newClient)
                    modelContext.insert(newTimeAddition)
                    newClient.timeAdditions.append(newTimeAddition)
                    dismiss()
                }
                .disabled(newClient.name.isEmpty)
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    confirmationShow = true
                }
            }
        }
        .confirmationDialog("Are you sure?", isPresented: $confirmationShow) {
            Button("Yes, delete it.", role: .destructive) {
                dismiss()
            }
        } message: {
            Text("Are you sure? You can't undo this.")
        }
    }
}

#Preview {
    NavigationStack {
        newClientModal()
            .modelContainer(SampleData.shared.modelContainer)
    }
}
