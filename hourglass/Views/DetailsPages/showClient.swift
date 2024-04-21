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
            HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                Text("Remaining Time")
                Spacer()
                Text("\(secondsToFullTime(client.timeAdded - client.timeUsed))")
                    .monospaced()
            })

            Section("Lifetime") {
                HStack(alignment: .center, content: {
                    Text("Added")
                    Spacer()
                    Text("\(secondsToFullTime(client.timeAdded))")
                        .monospaced()
                })
                HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                    Text("Used")
                    Spacer()
                    Text("\(secondsToFullTime(client.timeUsed))")
                        .monospaced()
                })
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
                        }
                    }
                }
            }

            Section("Time Additions") {
                Button("Add Time") {
                    print("add time function")
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
                        }
                    }
                }
            }
        }
        .navigationTitle(client.name)
    }
}

#Preview {
    NavigationStack {
        showClient(client: SampleData.shared.client)
    }
}
