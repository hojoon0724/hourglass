//
//  showSessionDetails.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/19/24.
//

import SwiftUI

struct showSessionDetails: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) var colorScheme

    @Bindable var session: Session

    @State var datePickerValue: Date = Date()

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Time")) {
                    HStack {
                        DatePicker("Start", selection: $session.startTime)
                    }
                    HStack {
                        Text("End")
                        Spacer()
                        Text("Stop Timer")
                    }
                }
            }
            .listStyle(.grouped)
        }
    }
}

#Preview {
    showSessionDetails(session: SampleData.shared.session)
        .modelContainer(SampleData.shared.modelContainer)
}
