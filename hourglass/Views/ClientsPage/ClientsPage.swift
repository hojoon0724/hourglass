//
//  ClientsPage.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/19/24.
//

import SwiftData
import SwiftUI

struct ClientsPage: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var userSettingsValues = UserSettingsValues.shared

    @Query(sort: \Client.name) private var clients: [Client]

    @State private var showInactiveClients: Bool = false
    @State private var newClientModalPageShowing: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Active")) {
                    ForEach(clients.filter { $0.active == true }, id: \.self) { client in
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
                        .listRowBackground(client.timeAdded - client.timeUsed <= 0 ? Color.red : client.timeAdded - client.timeUsed <= userSettingsValues.firstAlertThreshold ? Color.yellow : nil)
                        .foregroundColor(client.timeAdded - client.timeUsed <= 0 ? Color.white : client.timeAdded - client.timeUsed <= userSettingsValues.firstAlertThreshold ? Color.black : nil)
                    }
                }

                if clients.filter({ $0.active == false }).count > 0 {
                    if showInactiveClients == true {
                        Section(header: Text("Inactive")) {
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
                                .listRowBackground(client.timeAdded - client.timeUsed <= 0 ? Color.red : client.timeAdded - client.timeUsed <= userSettingsValues.firstAlertThreshold ? Color.yellow : nil)
                                .foregroundColor(client.timeAdded - client.timeUsed <= 0 ? Color.white : client.timeAdded - client.timeUsed <= userSettingsValues.firstAlertThreshold ? Color.black : nil)
                            }
                            .opacity(0.5)
                        }
                    }
                    Button((showInactiveClients ? "Hide " : "Show ") + "inactive clients") {
                        withAnimation {
                            showInactiveClients.toggle()
                        }
                    }
                }
            }
            #if os(visionOS)
            .listStyle(.insetGrouped)
            #else
            .listStyle(.grouped)
            #endif

            #if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            #endif
            .toolbar {
                ToolbarItem {
                    Button("Add New Client", systemImage: "plus") {
                        newClientModalPageShowing = true
                    }
                    .sheet(isPresented: $newClientModalPageShowing) {
                        NavigationStack {
                            newClientModal()
                        }
                    }
                    .navigationTitle("Clients")
                }
            }
            .navigationTitle("Clients")
        }
    }
}

#if os(visionOS)
    #Preview(windowStyle: .automatic, traits: .fixedLayout(width: 600, height: 1000)) {
        ContentView(selectedTab: "ClientsPage")
            .environmentObject(LocalNotificationManager())
            .modelContainer(SampleData.shared.modelContainer)
    }
#else
    #Preview {
        ContentView(selectedTab: "ClientsPage")
            .environmentObject(LocalNotificationManager())
            .modelContainer(SampleData.shared.modelContainer)
    }
#endif
