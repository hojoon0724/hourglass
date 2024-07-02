//
//  showAllAdd.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/20/24.
//

import SwiftUI

struct showAllAdd: View {
//    @State private var editAddModal: Bool = false
    @State private var selectedItem: TimeAddition?

    var sortedAddition: [TimeAddition]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Lifetime Sum")
                        Spacer()
                        Text("\(secondsToFullTime(sortedAddition.map { $0.timeAdded }.reduce(0,+)))")
                            .monospaced()
                    }
                }

                Section {
                    if sortedAddition.count > 0 {
                        ForEach(sortedAddition.sorted(by: { $0.timeStamp > $1.timeStamp })) { timeAddition in
                            HStack {
                                Text("\(timeAddition.timeStamp.formatted())")
                                Spacer()
                                Text("\(secondsToFullTime(timeAddition.timeAdded))")
                                    .monospaced()
                            }
                            .onTapGesture {
                                self.selectedItem = timeAddition
//                                self.editAddModal = true
                                print("\(String(describing: selectedItem))")
                            }
                            .sheet(item: $selectedItem) { timeAddition in
                                editTimeAdd(timeAddition: timeAddition)
                                    .presentationDetents([.height(230)])
                            }
                        }
                    } else {
                        HStack {
                            Text("Nothing added")
                                .opacity(0.5)
                        }
                    }
                }
            }
            .navigationTitle("All Additions")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    NavigationStack {
        showAllAdd(sortedAddition: SampleData.shared.client.timeAdditions)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
