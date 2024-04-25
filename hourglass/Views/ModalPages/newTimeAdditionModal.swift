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
    @State var hours: Int?
    @State var minutes: Int?

    @State var clientColor = Color.gray

    @State var timeInSec: Int = 0

    @State var confirmationShow = false

    @State private var now: Date = .now

    var body: some View {
        List {
            Section(header: Text("Client")) {
                HStack(alignment: .center, content: {
                    Text("Name")
                    Spacer()
                    Text("\(clientPassed.name)")
                        .multilineTextAlignment(.trailing)
                })
            }

            Section(header: Text("Time to add")) {
                HStack(alignment: .center, content: {
                    Text("Hours")
                    TextField("Enter Hours", value: $hours, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                })
                HStack(alignment: .center, content: {
                    Text("Minutes")
                    TextField("Enter Minutes", value: $minutes, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                })
            }
        }
        .listStyle(.grouped)
//        .navigationTitle("New Client")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add") {
                    newTimeAddition.timeAdded = fullTimeToSeconds(hours ?? 0, minutes ?? 0, 0)
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
