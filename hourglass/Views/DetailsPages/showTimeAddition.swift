//
//  showTimeAddition.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/22/24.
//

import SwiftData
import SwiftUI

struct showTimeAddition: View {
    @Bindable var timeAddition: TimeAddition

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var now: Date = .now

    @State private var hours: Int = 0
    @State private var minutes: Int = 0

    @State var confirmationShow = false

    var body: some View {
        Form {
            Section(header: Text("Time to add")) {
                HStack(alignment: .center, content: {
                    Text("Hours")
                    TextField("Enter Hours", value: $hours, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                })
                HStack(alignment: .center, content: {
                    Text("Minutes")
                    TextField("Enter Minutes", value: $minutes, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                })
            }

            Section(header: Text("Last edited: \(timeAddition.timeStamp.formatted())")) {
            }

            Button("Delete Time Addition", role: .destructive) {
                confirmationShow = true
            }
        }
        .navigationTitle("Time Addition")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    timeAddition.timeAdded = fullTimeToSeconds(hours, minutes, 0)
                    timeAddition.timeStamp = now
                    dismiss()
                }
            }
        }
        .confirmationDialog("Are you sure?", isPresented: $confirmationShow) {
            Button("Yes, delete it.", role: .destructive) {
                modelContext.delete(timeAddition)
                dismiss()
            }
        } message: {
            Text("Are you sure? You can't undo this.")
        }
        .onAppear(perform: {
            hours = timeAddition.timeAdded / 3600
            minutes = (timeAddition.timeAdded % 3600) / 3600
        })
    }
}

#Preview {
    NavigationStack {
        showTimeAddition(timeAddition: SampleData.shared.timeAddition)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
