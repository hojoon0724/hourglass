//
//  ContentView.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftData
import SwiftUI

struct ProjectsPage: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var show_modal: Bool = false

    var body: some View {
        VStack {
//      Button(action: {
//        print("Button Pushed")
//        self.show_modal = true
//      }) {
//        Text("Show Modal")
//      }.sheet(isPresented: self.$show_modal) {
//        projectAddModal()
//      }

            NavigationSplitView {
                List {
                    // Show all projects only

                    ForEach(allTestProjects) { project in
                        NavigationLink(destination: showProject(project: project)) {
                            Image(systemName: "circle.fill")
                                .foregroundColor(project.color)
                                .padding(.trailing, 10)
                            VStack(alignment: .leading, content: {
                                Text("\(project.name)")
                                Text("\(project.clientName)")
                                    .font(.caption)
                            })
                        }
                    }

                    // Client header - Project Below
//                    ForEach(clients) { client in
//                        Section(header: Text(String(client.name).foregroundColor(.blue))) {
//                            ForEach(client.projects) { project in
//                                Text("\(project.name)")
//                            }
//                        }
//                    }
                }
                .navigationTitle("Projects")
                //                    .onDelete(perform: deleteItems)
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

//            Button(action: addItem) {
//              Label("Add Item", systemImage: "plus")
//            }.sheet(isPresented: self.$show_modal, content: {
//              projectAddModal()
//            })
                    }
                }
            } detail: {
                Text("Select an item")
            }
        }
    }

//    private func closeModal() {
//        show_modal = false
//    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView(selectedTab: "ProjectsPage")
}
