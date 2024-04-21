//
//  showSession.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/20/24.
//

import SwiftData
import SwiftUI

struct showSession: View {
    @Bindable var session: Session
    @Query(sort: \Client.name) private var clientList: [Client]

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var now: Date = .now
    @State private var selectedClient: String = ""

    var body: some View {
        Form {
            Section(header: Text("Time")) {
                HStack(content: {
                    Text("Start")
                    Spacer()
                    DatePicker("", selection: $session.startTime)
                        .onChange(of: session.startTime) {
                            session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
                        }
                })
                HStack(content: {
                    Text("End")
                    Spacer()

                    if session.running == true {
                        Button("Stop Timer") {
                            print("stop timer button pressed")
                        }
                    } else {
                        DatePicker("", selection: Binding<Date>($session.endTime)!)
                            .onChange(of: session.endTime) {
                                session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
                            }
                    }

                })
                HStack(content: {
                    Text("Duration")
                    Spacer()
                    Text(session.secondsElapsed != nil ? "\(secondsToFullTime(session.secondsElapsed!))" : "Running")
                        .monospaced()
                })
            }

            Section(header: Text("")) {
                Picker("Client", selection: $selectedClient) {
                    Text("None").tag(Optional<String>(nil))
                    ForEach(clientList, id: \.name) { client in
                        Text(client.name)
                    }
                }
                .pickerStyle(.automatic)
            }
            Button("Print") {
                print($selectedClient)
            }
        }
        .navigationTitle("Session")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        showSession(session: SampleData.shared.session)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
