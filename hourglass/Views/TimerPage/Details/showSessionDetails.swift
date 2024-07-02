//
//  showSessionDetails.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/19/24.
//

import SwiftData
import SwiftUI

struct showSessionDetails: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    @Query(sort: \Client.name) private var clientList: [Client]

    @Bindable var session: Session

    @State var datePickerValue: Date = Date()

    @State var confirmationShow = false

    var body: some View {
        List {
            Section {
                HStack {
                    DatePicker("Start", selection: $session.startTime)
                        .onChange(of: session.startTime) {
                            session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
                            session.editedTimestamp = .now
                        }
                }
                HStack {
                    DatePicker("End", selection: Binding<Date>($session.endTime)!)
                        .onChange(of: session.endTime) {
                            session.secondsElapsed = Int((session.endTime?.timeIntervalSince(session.startTime))!)
                            session.editedTimestamp = .now
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
        .listStyle(.grouped)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    modelContext.rollback()
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text(modelContext.hasChanges ? "Cancel" : "Back")
                    }
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    try? modelContext.save()
                    dismiss()
                }
                .disabled(modelContext.hasChanges ? false : true)
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
        NavigationLink("Go to Session Details") {
            showSessionDetails(session: SampleData.shared.session)
                .modelContainer(SampleData.shared.modelContainer)
        }
    }
}
