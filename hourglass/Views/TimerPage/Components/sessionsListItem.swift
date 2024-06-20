//
//  sessionsListItem.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/19/24.
//

import SwiftData
import SwiftUI

struct sessionsListItem: View {
    // not using because the colors don't re-render when changed and then canceled
    @Environment(\.colorScheme) var colorScheme

    var session: Session

    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .foregroundColor(customColors[session.client?.color ?? "None"])
                .padding(.trailing, 10)
                .shadow(radius: 3)

            VStack(alignment: .leading) {
                Text(session.secondsElapsed != nil ? secondsToFullTime(session.secondsElapsed!) : "Running")
                    .monospaced()
                Text("\(session.startTime.formatted(date: .numeric, time: .standard))")
                    .font(.caption)
                Text(session.client != nil ? "\(session.client!.name)" : "")
                    .font(.caption)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    List {
        sessionsListItem(session: SampleData.shared.session)
            .modelContainer(SampleData.shared.modelContainer)
    }
    .listStyle(.grouped)
    .frame(maxWidth: .infinity)
    .defaultScrollAnchor(.top)
}
