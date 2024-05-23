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

    @State private var hours: Double = 0
    @State private var minutes: Double = 0

    @State var confirmationShow = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Time added")
                    .font(.title3)
                Spacer()
                TextFieldStepper(
                    doubleValue: $hours,
                    unit: "h",
                    label: ""
                )

                TextFieldStepper(
                    doubleValue: $minutes,
                    unit: "m",
                    label: "",
                    maximum: 59
                )
            }
            .padding()
            List {
                Section {
                    Button("Delete Time Addition", role: .destructive) {
                        confirmationShow = true
                    }
                } header: {
                    Spacer()
                } footer: {
                    Text("Added: \(timeAddition.timeStamp.formatted())")
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Time Addition")
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    timeAddition.timeAdded = fullTimeToSeconds(Int(hours), Int(minutes), 0)
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
            hours = Double(timeAddition.timeAdded / 3600)
            minutes = Double((timeAddition.timeAdded % 3600) / 60)
        })
    }
}

#Preview {
    NavigationStack {
        showTimeAddition(timeAddition: SampleData.shared.timeAddition)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
