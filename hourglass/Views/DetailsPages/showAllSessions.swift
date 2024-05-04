//
//  showAllSessions.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/25/24.
//

import SwiftUI

struct showAllSessions: View {
    var sortedSessions: [Session]
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("All Sessions")
                        Spacer()
                        Text("\(secondsToFullTime(sortedSessions[0].client!.timeUsed))")
                            .monospaced()
                        
                    }
                }
                Section {
                    ForEach(sortedSessions.sorted(by: { $0.startTime > $1.startTime })) { session in
                        HStack {
                            Text("\(session.startTime.formatted())")
                            Spacer()
                            Text("\(secondsToFullTime(session.secondsElapsed!))")
                                .monospaced()
                            //                        }
                        }
                        .opacity(0.5)
                    }
                }
            }
        }
        .navigationTitle("All Sessions")
        .listStyle(.grouped)
    }
}

#Preview {
    showAllSessions(sortedSessions: SampleData.shared.client.sessions)
        .modelContainer(SampleData.shared.modelContainer)
}
