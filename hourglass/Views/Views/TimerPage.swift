//
//  TimerPage.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftData
import SwiftUI

struct TimerPage: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Session.startTime, order: .reverse) private var sessions: [Session]

    @State private var newSession: Session = Session(running: false, startTime: .now, secondsElapsed: 0, editedTimestamp: .now)
    @State private var newSessionModal: Bool = false
    @State var clock: Int = 0
    @State var timer: Timer?

    var body: some View {
        NavigationView {
            VStack(spacing: 0, content: {
                // Time Log Area
                List {
                    // Replace with data - maybe refactor as component
                    ForEach(sessions) { session in
                        NavigationLink(destination: showSession(session: session)) {
//                            Text("\(session.startTime)")
                            HStack(content: {
                                Image(systemName: "circle.fill")
                                    // change color to variable
                                    .foregroundColor(.red)
                                    .padding(.trailing, 10)

                                VStack(alignment: .leading, content: {
                                    Text(session.secondsElapsed != nil ? secondsToFullTime(session.secondsElapsed!) : "Running")
                                        .monospaced()
                                    Text("\(session.startTime.formatted(date: .numeric, time: .standard))")
                                        .font(.caption)
                                    Text(session.client != nil ? "\(session.client!.name)" : "")
                                        .font(.caption)
                                })
                            })

                            Spacer()
                        }
                        .flippedUpsideDown()
                    }
//                    .onDelete(perform: deleteSession)
                }
                .frame(maxWidth: .infinity)
                .defaultScrollAnchor(.top)
                .flippedUpsideDown()

                //            Button + Timer - Refactor as component
                Button(action: { self.newSessionModal = true }, label: {
                    HStack(content: {
                        // Button - Dynamic
                        if newSession.running == false {
                            Button(action: startSession) {
                                Image(systemName: "play.circle.fill")
                            }
                            .font(.largeTitle)
                            .foregroundColor(.green)
                        } else {
                            Button(action: stopSession) {
                                Image(systemName: "stop.circle.fill")
                            }
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        }
                        Spacer()

                        // Timer + Project Details

                        VStack(alignment: .trailing, content: {
                            HStack(content: {
                                Image(systemName: "circle.fill")
                                    // change color to variable
                                    .foregroundColor(.red)
                                Text("\(secondsToFullTime(clock))")
                                    .monospaced()
                                    .font(.system(size: 24))

                            })

                            HStack(content: {
                                Text("\(newSession.client?.name ?? "")").font(.footnote)
                            })
                        })
                    })
                    .padding()
                    .sheet(isPresented: self.$newSessionModal) {
                        showSession(session: newSession)
                    }
                })
                .buttonStyle(PlainButtonStyle())
                .border(width: 1, edges: [.top], color: .gray.opacity(0.5))
            })
        }
    }

    func startSession() {
        newSession = Session(running: true, startTime: .now, editedTimestamp: .now)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            clock = Int(Date.now.timeIntervalSince(newSession.startTime)
            )
        }
    }

    func stopSession() {
        newSession.running = false
        newSession.endTime = .now
        newSession.secondsElapsed = Int((newSession.endTime?.timeIntervalSince(newSession.startTime))!)
        timer?.invalidate()
        modelContext.insert(newSession)
        clock = 0
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
