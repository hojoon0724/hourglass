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
    @Query private var items: [Item]
    @State private var show_modal: Bool = false

    var body: some View {
        VStack {
            NavigationSplitView {
                List {
                    // Show all clients only

                    ForEach(allTestClients) { client in
                        NavigationLink(destination: showClient()) {
                            VStack(alignment: .leading, content: {
                                Text("\(client.name)")
                                Text(secondsToFullTime(client.time))
                                    .font(.caption)
                                    .monospaced()
                            })
                        }
                    }
                }
                .navigationTitle("Clients")

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
                            Button(action: {
                                self.show_modal = true
                            }) {
                                Label("Add Item", systemImage: "plus")
                            }
                            .sheet(isPresented: self.$show_modal) {
                                projectAddModal()
                            }
                        }
                    }
            } detail: {
                Text("Select an item")
                    .navigationTitle("Clients")
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ClientsPage()
}
