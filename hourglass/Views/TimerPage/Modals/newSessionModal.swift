//
//  newSessionModal.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/19/24.
//

import SwiftData
import SwiftUI

struct newSessionModal: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    @Query(sort: \Client.name) private var clientList: [Client]

    @Bindable var session: Session

    @State var now: Date = .now

    var stopTimer: () -> Void

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Time")) {
                    HStack {
                        DatePicker("Start", selection: $session.startTime)
                    }
                    HStack {
                        Text("End")
                        Spacer()
                        if session.running == true {
                            Button("Stop Timer") {
                                stopTimer()
                                dismiss()
                            }
                        } else {
                            Spacer()
                        }
                    }
                    HStack {
                        Text("Duration")
                        Spacer()
                        Text("\(secondsToFullTime(session.secondsElapsed ?? 0))")
                            .monospaced()
                    }
                }

                Section {
                    Picker("Client", selection: $session.client) {
                        Text("None").tag(nil as Client?)
                        ForEach(clientList.filter { $0.active == true }) { client in
                            Text(client.name).tag(client as Client?)
                        }
                    }
                    .pickerStyle(.automatic)
                }
            }
            .navigationTitle(session.running == true ? "Current Session" : "New Session")
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
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
            newSessionModal(
                session:
                Session(running: false,
                        startTime: .now, secondsElapsed: 0,
                        editedTimestamp: .now),
                stopTimer: {}
            )
        }
        .modelContainer(SampleData.shared.modelContainer)
    }
}
