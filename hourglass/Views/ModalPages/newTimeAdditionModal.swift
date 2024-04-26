//
//  newTimeAdditionModal.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/21/24.
//

import SwiftData
import SwiftUI

struct newTimeAdditionModal: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    var clientPassed: Client
    init(clientPassed: Client) {
        self.clientPassed = clientPassed
        clientColor = Color(clientPassed.color)
    }

    @State var newTimeAddition: TimeAddition = TimeAddition(timeStamp: .now, timeAdded: 0)

    @State private var hours: Double = 0
    @State private var minutes: Double = 0

    @State var clientColor = Color.gray

    @State var timeInSec: Int = 0

    @State var confirmationShow = false

    @State private var now: Date = .now

    var body: some View {
        VStack {
            List {
                Section(header: Text("Client")) {
                    HStack(alignment: .center, content: {
                        Text("Name")
                        Spacer()
                        Text("\(clientPassed.name)")
                            .multilineTextAlignment(.trailing)
                    })
                }
                Section {
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
                        Spacer()
                    }
                    .padding()
                } header: {
                    Text("Additional Time")
                }
            }

            .listStyle(.grouped)
            //        .navigationTitle("New Client")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        newTimeAddition.timeAdded = fullTimeToSeconds(Int(hours), Int(minutes), 0)
                        modelContext.insert(newTimeAddition)
                        clientPassed.timeAdditions.append(newTimeAddition)
                        dismiss()
                    }
                    .disabled(clientPassed.name.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        VStack {
            Spacer()
            Button("Show Modal") {
            }
            .padding()
        }
        .sheet(isPresented: .constant(true)) {
            NavigationView {
                newTimeAdditionModal(clientPassed: SampleData.shared.client)
                    .modelContainer(SampleData.shared.modelContainer)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
