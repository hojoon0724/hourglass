//
//  showClient.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/20/24.
//

import SwiftData
import SwiftUI

struct showClient: View {
    @Bindable var client: Client

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    var colorList: Array = colorArray

    @State var discardChagesConfirmationShow = false
    @State var addTimeModal = false
    @State var deleteConfirmationShow = false
//
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
        NavigationStack {
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
                    Toggle(isOn: $client.active) {
                        Text("Active")
                    }
                }

                HStack {
                    Text("Remaining Time")
                    Spacer()
                    Text("\(secondsToFullTime(client.timeAdded - client.timeUsed))")
                        .monospaced()
                }
                .opacity(0.5)

                Button("Add more time") {
                    addTimeModal = true
                }
                .sheet(isPresented: self.$addTimeModal) {
                    NavigationStack {
                        newTimeAdd(clientPassed: client)
                            .presentationDetents([.height(230)])
                    }
                }

                Section("Lifetime") {
                    NavigationLink(destination: showAllAdd(sortedAddition: sortedAdditions)) {
//                    NavigationLink(destination: showAllAdd(clientName: client.name)) {
                        HStack {
                            Text("Added")
                            Spacer()
                            Text("\(secondsToFullTime(client.timeAdded))")
                                .monospaced()
                        }
                    }

                    NavigationLink(destination: showAllSessions(sortedSessions: sortedSessions)) {
                        HStack {
                            Text("Used")
                            Spacer()
                            Text("\(secondsToFullTime(client.timeUsed))")
                                .monospaced()
                        }
                    }
                }

                Button("Delete Client", role: .destructive) {
                    deleteConfirmationShow = true
                }
            }
            .listStyle(.grouped)
            .navigationTitle(client.name)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        if modelContext.hasChanges {
                            discardChagesConfirmationShow = true
                        } else {
                            dismiss()
                        }
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
            .confirmationDialog("Are you sure?", isPresented: $discardChagesConfirmationShow) {
                Button("Yes, discard changes.", role: .destructive) {
                    modelContext.rollback()
                    dismiss()
                }
            } message: {
                Text("Are you sure? This will discard all changes made.")
            }

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
}

#Preview {
    showClient(client: SampleData.shared.client)
        .modelContainer(SampleData.shared.modelContainer)
}
