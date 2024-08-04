//
//  newTimeAdd.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/20/24.
//

import SwiftData
import SwiftUI

struct editTimeAdd: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Bindable var timeAddition: TimeAddition

    @State var hours: Double = 0
    @State var minutes: Double = 0

    var body: some View {
        NavigationStack {
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Text("Time to add")
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
            }
            .padding()
            .listStyle(.grouped)
            Spacer()
            Button(role: .destructive) {
                modelContext.delete(timeAddition)
                try? modelContext.save()
                dismiss()

            } label: {
                Text("Delete Addition")
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .buttonStyle(.borderedProminent)

            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        timeAddition.timeAdded = fullTimeToSeconds(Int(hours), Int(minutes), 0)
                        dismiss()
                    }
                    .disabled((timeAddition.timeAdded == fullTimeToSeconds(Int(hours), Int(minutes), 0)) ? true : false)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                hours = Double(timeAddition.timeAdded / 3600)
                minutes = Double(timeAddition.timeAdded % 3600 / 60)
            }
        }
    }
}

#Preview {
    NavigationStack {
        VStack {
            Spacer()
            Button("Show Modal") {
            }
            .padding()
        }
        .sheet(isPresented: .constant(true)) {
            editTimeAdd(timeAddition: SampleData.shared.client.timeAdditions[0])
                .modelContainer(SampleData.shared.modelContainer)
//                .presentationDetents([.height(290)])
        }
    }
}
