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

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \Client.name) private var clientList: [Client]
    @State private var now: Date = .now

    @State var confirmationShow = false

    var body: some View {
        List {
            Section(header: Text("Time")) {
                HStack(content: {
                    DatePicker("Start", selection: $session.startTime)
                        .onChange(of: session.startTime) {
                            session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
                            session.editedTimestamp = .now
                        }
                })
                HStack(content: {
                    Text("End")
                    Spacer()
                    if session.running == false && session.endTime == nil {
                    } else if session.endTime == nil {
                        Button("Stop Timer") {
                            print("stop timer button pressed")
                        }

                    } else {
                        DatePicker("", selection: Binding<Date>($session.endTime)!)
                            .onChange(of: session.endTime) {
                                session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
                                session.editedTimestamp = .now
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

            Section {
                HStack {
                    Text("Client")
                    Spacer()
                        .foregroundColor(customColors[session.client?.color ?? "None"])
                    Picker("", selection: $session.client) {
                        Text("None").tag(nil as Client?)
                        ForEach(clientList.filter { $0.active == true }) { client in
                            Text(client.name).tag(client as Client?)
                        }
                    }
                    .pickerStyle(.automatic)
                    .onChange(of: session.client) {
                        session.editedTimestamp = .now
                    }
                }
            }

            Section {
                Button("Delete Session", role: .destructive) {
                    confirmationShow = true
                }
            } footer: {
                Text("Last edited: \(session.editedTimestamp.formatted())")
            }
        }
        .navigationTitle("Session")
        .listStyle(.grouped)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }
        }
        .confirmationDialog("Are you sure?", isPresented: $confirmationShow) {
            Button("Yes, delete it.", role: .destructive) {
                modelContext.delete(session)
                dismiss()
            }
        } message: {
            Text("Are you sure? You can't undo this.")
        }
    }
}

#Preview {
    NavigationStack {
        showSession(session: SampleData.shared.session)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
