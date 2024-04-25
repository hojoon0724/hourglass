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
    @State private var show_modal: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(clients) { client in
                    NavigationLink(destination: showClient(client: client)) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(customColors[client.color])
                                .shadow(radius: 3)
                            Text("\(client.name)")
                            Spacer()
                            Text(secondsToFullTime(client.timeAdded - client.timeUsed))
                                .font(.subheadline)
                                .monospaced()
                        }
                    }
                    .listRowBackground(client.timeAdded <= 3600 ? Color.red : client.timeAdded <= 7200 ? Color.yellow : nil)
                    .foregroundColor(client.timeAdded <= 3600 ? Color.white : client.timeAdded <= 7200 ? Color.black : nil)
                }
                .onDelete(perform: deleteItems)
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
