//
//  ClientsPage.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import SwiftData
import SwiftUI

struct ClientsPage: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Client.name) private var clients: [Client]

//    @State private var warningLabelThreshold: Int = UserDefaults.standard.integer(forKey: "firstAlertThreshold")
    @State private var warningLabelThreshold: Int = 7200

    @State private var show_modal: Bool = false

    @State private var showInactiveClients: Bool = false

    var body: some View {
        NavigationStack {
            List {
//                TextField("Enter Hours", value: $warningLabelThreshold, format: .number)
//                    .keyboardType(.numberPad)
//                    .multilineTextAlignment(.trailing)
                Section {
//                    ForEach(clients) { client in
                    ForEach(clients.filter { $0.active == true }) { client in
                        NavigationLink(destination: showClient(client: client)) {
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(customColors[client.color])
                                    .shadow(radius: 3)
                                Text("\(client.name)")
                                Spacer()
                                Text(secondsToFullTime(client.timeAdded - client.timeUsed))
                                    .monospaced()
                            }
                        }
                        .listRowBackground(client.timeAdded - client.timeUsed <= 0 ? Color.red : client.timeAdded - client.timeUsed <= warningLabelThreshold ? Color.yellow : nil)
                        .foregroundColor(client.timeAdded - client.timeUsed <= 0 ? Color.white : client.timeAdded - client.timeUsed <= warningLabelThreshold ? Color.black : nil)
                    }
                    .onDelete(perform: deleteItems)
                } header: {
                    Text("Active")
                }

                if clients.filter({ $0.active == false }).count > 0 {
                    if showInactiveClients == true {
                        Section {
                            ForEach(clients.filter { $0.active == false }) { client in
                                NavigationLink(destination: showClient(client: client)) {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(customColors[client.color])
                                            .shadow(radius: 3)
                                        Text("\(client.name)")
                                        Spacer()
                                        Text(secondsToFullTime(client.timeAdded - client.timeUsed))
                                            .monospaced()
                                    }
                                }
                            }
                            .onDelete(perform: deleteItems)
                            .opacity(0.5)
                        } header: {
                            Text("Inactive")
                        }
                    }
                }

                if clients.filter({ $0.active == false }).count > 0 {
                    Button((showInactiveClients ? "Hide " : "Show ") + "inactive clients") {
                        withAnimation {
                            showInactiveClients.toggle()
                        }
                    }
                }

//                Button("print user def") {
//                    print(UserDefaults.standard.dictionaryRepresentation())
//                }
            }

            .listStyle(.grouped)
            #if os(macOS)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            #endif
//                      add + edit buttons
                .toolbar {
                    #if os(iOS)
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    #endif
                    ToolbarItem {
                        Button("Add Item", systemImage: "plus") {
                            self.show_modal = true
                        }
                        .sheet(isPresented: self.$show_modal) {
                            NavigationStack {
                                newClientModal()
                            }
                        }
                        .navigationTitle("Clients")
                    }
                }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(clients[index])
            }
        }
    }
}

#Preview {
    ContentView(selectedTab: "ClientsPage")
        .modelContainer(SampleData.shared.modelContainer)
}
