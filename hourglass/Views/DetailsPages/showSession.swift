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
        Form {
            Section(header: Text("Time")) {
                HStack(content: {
                    DatePicker("Start", selection: $session.startTime)
                        .onChange(of: session.startTime) {
                            session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
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
                Picker("Client", selection: $session.client) {
                    Text("None").tag(nil as Client?)
                    ForEach(clientList) { client in
                        Text(client.name).tag(client as Client?)
                    }
                }
                .pickerStyle(.automatic)
            }

            Button("Delete Session", role: .destructive) {
                confirmationShow = true
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
        .confirmationDialog("Are you sure?", isPresented: $confirmationShow) {
            Button("Yes, delete it.", role: .destructive) {
                print(session.startTime)
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
