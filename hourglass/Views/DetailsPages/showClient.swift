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
    var colorList: Array = colorArray

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
            Section {
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("Required", text: $client.name, prompt: Text("Required"))
                        .multilineTextAlignment(.trailing)
                        .textInputAutocapitalization(.words)
                }
                HStack {
                    Picker("Color", selection: $client.color) {
                        ForEach(colorList, id: \.self) { color in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(customColors[color])
                                    .padding(.trailing, 10)
                                    .shadow(radius: 3)
                                    .tag(color as String)
                                Text(color)
                            }
                        }
                    }
                    .pickerStyle(.navigationLink)
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
                        NavigationLink(destination: showTimeAddition(timeAddition: addition)) {
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
        .onAppear {
//            ForEach(colorList) { color in
//                print(color)
//            }
        }
        .listStyle(.grouped)
        .navigationTitle(client.name)
        .confirmationDialog("Are you sure?", isPresented: $deleteConfirmationShow) {
            Button("Yes, delete it.", role: .destructive) {
                modelContext.delete(client)
                dismiss()
            }
        } message: {
            Text("Are you sure? This will delete the client and all associated data. This cannot be undone.")
        }
    }
}

#Preview {
    NavigationView {
        showClient(client: SampleData.shared.client)
    }
}
