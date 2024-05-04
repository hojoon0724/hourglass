//
//  showNewSession.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/24/24.
//

import SwiftData
import SwiftUI

struct showNewSession: View {
    @Bindable var session: Session

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \Client.name) private var clientList: [Client]
    @State private var now: Date = .now

    @State var confirmationShow = false

    var stopSession: () -> Void

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Time")) {
                    HStack(content: {
                        DatePicker("Start", selection: $session.startTime)
                            .onChange(of: session.startTime) {
                                session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
                            }
                    })
                    HStack {
                        Text("End")
                        Spacer()
                        if session.running == false && session.endTime == nil {
                        } else if session.endTime == nil {
                            Button("Stop Timer") {
                                dismiss()
                                stopSession()
                            }
                        }
                    }
//                        } else {
//                    HStack {
//                        DatePicker("", selection: Binding<Date>($session.endTime)!)
//                            .onChange(of: session.endTime) {
//                                session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
//                            }
//                    }

                    HStack(content: {
                        Text("Duration")
                        Spacer()
                        Text("\(secondsToFullTime(session.secondsElapsed!))")
                            .monospaced()
                    })
                }

                Section(header: Text("")) {
                    Picker("Client", selection: $session.client) {
                        Text("None").tag(nil as Client?)
                        ForEach(clientList.filter { $0.active == true }) { client in
                            Text(client.name).tag(client as Client?)
                        }
                    }
                    .pickerStyle(.automatic)
                }
            }

            .navigationTitle(session.running == false ? "New Session" : "Current Session")
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
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
            showNewSession(session: Session(running: false, startTime: .now, secondsElapsed: 0, editedTimestamp: .now), stopSession: {
                print("stopSession Func pressed")
            })
            .modelContainer(SampleData.shared.modelContainer)
        }
    }
}
