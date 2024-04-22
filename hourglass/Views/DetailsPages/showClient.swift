//
//  showClient.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import SwiftUI

struct showClient: View {
    @Bindable var client: Client

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State var confirmationShow = false
    @State var addTimeModal = false
    @State var deleteConfirmationShow = false

    var sortedSessions: [Session] {
        client.sessions.sorted { first, second in
            first.startTime > second.startTime
        }
    }

    var sortedAdditions: [TimeAddition] {
        client.timeAdditions.sorted { first, second in
            first.timeStamp > second.timeStamp
        }
    }

    var body: some View {
        List {
            Section("") {
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("Required", text: $client.name, prompt: Text("Required"))
                        .multilineTextAlignment(.trailing)
                }
            }
            HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                Text("Remaining Time")
                Spacer()
                Text("\(secondsToFullTime(client.timeAdded - client.timeUsed))")
                    .monospaced()
            })
            .opacity(0.5)

            Section("Lifetime") {
                HStack(alignment: .center, content: {
                    Text("Added")
                    Spacer()
                    Text("\(secondsToFullTime(client.timeAdded))")
                        .monospaced()
                })
                .opacity(0.5)
                HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                    Text("Used")
                    Spacer()
                    Text("\(secondsToFullTime(client.timeUsed))")
                        .monospaced()
                })
                .opacity(0.5)
            }

            if !client.sessions.isEmpty {
                Section("Sessions") {
                    ForEach(sortedSessions) { session in
                        VStack {
                            HStack {
                                Text(String("\(session.startTime.formatted())"))
                                Spacer()
                                Text(String("\(secondsToFullTime(session.secondsElapsed!))"))
                                    .monospaced()
                            }
                            .opacity(0.5)
                        }
                    }
                }
            }

            Section("Time Additions") {
                Button("Add Time") {
                    addTimeModal = true
                }
                .sheet(isPresented: self.$addTimeModal) {
                    NavigationStack {
                        newTimeAdditionModal(clientPassed: client)
                    }
                }

                if !client.timeAdditions.isEmpty {
                    ForEach(sortedAdditions) { addition in
                        VStack {
                            HStack {
                                Text(String("\(addition.timeStamp.formatted())"))
                                Spacer()
                                Text(String("\(secondsToFullTime(addition.timeAdded))"))
                                    .monospaced()
                            }
                            .opacity(0.5)
                        }
                    }
                }
            }

            Button("Delete Client", role: .destructive) {
                deleteConfirmationShow = true
            }
        }
        .navigationTitle(client.name)
        .confirmationDialog("Are you sure?", isPresented: $deleteConfirmationShow) {
            Button("Yes, delete it.", role: .destructive) {
                modelContext.delete(client)
                dismiss()
            }
        } message: {
            Text("Are you sure? You can't undo this.")
        }
    }
}

#Preview {
    NavigationStack {
        showClient(client: SampleData.shared.client)
    }
}
