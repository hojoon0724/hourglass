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
        List {
//            Section(header: Text("Time to add")) {
//                HStack(alignment: .center, content: {
//                    Text("Hours")
//                    TextField("Enter Hours", value: $hours, format: .number)
//                        .keyboardType(.numberPad)
//                        .multilineTextAlignment(.trailing)
//                })
//                HStack(alignment: .center, content: {
//                    Text("Minutes")
//                    TextField("Enter Minutes", value: $minutes, format: .number)
//                        .keyboardType(.numberPad)
//                        .multilineTextAlignment(.trailing)
//                })
//            }
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
                Spacer()
            }
            .padding()
            Section {
                Button("Delete Time Addition", role: .destructive) {
                    confirmationShow = true
                }
            } header: {
                Spacer()
            } footer: {
                Text("Last edited: \(timeAddition.timeStamp.formatted())")
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Time Addition")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    timeAddition.timeAdded = fullTimeToSeconds(Int(hours), Int(minutes), 0)
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
            hours = Double(timeAddition.timeAdded / 3600)
            minutes = Double((timeAddition.timeAdded % 3600) / 3600)
        })
    }
}

#Preview {
    NavigationStack {
        showTimeAddition(timeAddition: SampleData.shared.timeAddition)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
