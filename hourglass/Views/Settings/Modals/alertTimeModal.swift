//
//  alertTimeModal.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/28/24.
//

import SwiftUI

struct alertTimeModal: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State var hours: Double = 0
    @State var minutes: Double = 0
    @Binding var threshold: Int

    var text: String = ""

    var body: some View {
        HStack {
            Spacer()
            Text("\(text)")
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
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .onAppear {
            hours = Double(threshold / 3600)
            minutes = Double(threshold % 3600 / 60)
        }
        .onChange(of: hours) {
            threshold = fullTimeToSeconds(Int(hours), Int(minutes), 0)
        }
        .onChange(of: minutes) {
            threshold = fullTimeToSeconds(Int(hours), Int(minutes), 0)
        }
    }
}

#Preview {
    alertTimeModal(threshold: UserSettingsValues.shared.$firstAlertThreshold)
}
