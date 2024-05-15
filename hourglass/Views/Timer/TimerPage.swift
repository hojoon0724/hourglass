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
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var localNotificationsManager: LocalNotificationManager
    
    @Query(sort: \Session.startTime, order: .reverse) private var sessions: [Session]

    @State private var newSession: Session = Session(running: false, startTime: .now, secondsElapsed: 0, editedTimestamp: .now)
    @State var clock: Int = 0

    @State private var newSessionModal: Bool = false
    @State var timer: Timer?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0, content: {
                List {
                    ForEach(sessions.filter { $0.endTime != nil }) { session in
                        NavigationLink(destination: showSession(session: session)) {
                            HStack(content: {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(customColors[session.client?.color ?? "None"])
                                    .padding(.trailing, 10)
                                    .shadow(radius: 3)

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
                }
                .listStyle(.grouped)
                .frame(maxWidth: .infinity)
                .defaultScrollAnchor(.top)
                .flippedUpsideDown()
                .ignoresSafeArea()

//              Button + Timer - Refactor as component
                HStack {
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
//                  Timer + Project Details
                    VStack(alignment: .trailing, content: {
                        HStack(content: {
                            Image(systemName: "circle.fill")
                                .foregroundColor(customColors[newSession.client?.color ?? "None"])
                                .shadow(radius: 3)
                            Text("\(secondsToFullTime(clock))")
                                .monospaced()
                                .font(.system(size: 24))
                        })

                        HStack(content: {
                            Text("\(newSession.client?.name ?? "No Client Selected")").font(.footnote)
                        })
                    })
                }
                #if os(iOS) || os(watchOS)
                .padding()

                #elseif os(macOS) || os(tvOS) || os(visionOS)
                .padding(30)

                #endif
                .sheet(isPresented: self.$newSessionModal) {
                    showNewSession(session: newSession, stopSession: stopSession)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.newSessionModal = true
                }
                .border(width: 1, edges: [.top], color: .gray.opacity(0.5))
            })
        }
    }

    func startSession() {
        newSession.running = true
        newSession.startTime = .now
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            clock = Int(Date.now.timeIntervalSince(newSession.startTime))
            newSession.secondsElapsed = clock
        }
        // schedule timer based on the client's leftover
    }

    func stopSession() {
        newSession.running = false
        newSession.endTime = .now
        newSession.secondsElapsed = Int((newSession.endTime?.timeIntervalSince(newSession.startTime))!)
        timer?.invalidate()
        modelContext.insert(newSession)
        newSession = Session(running: false, startTime: .now, secondsElapsed: 0, editedTimestamp: .now)
        clock = 0
    }

//    private func deleteSession(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(sessions[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .environmentObject(LocalNotificationManager())
        .modelContainer(SampleData.shared.modelContainer)
}
