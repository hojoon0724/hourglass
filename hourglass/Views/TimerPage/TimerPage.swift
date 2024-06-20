//
//  TimerPage.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/19/24.
//

import SwiftData
import SwiftUI

struct TimerPage: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) var colorScheme

    @Query(sort: \Session.startTime, order: .reverse) private var sessions: [Session]

    @State var timerIsRunning = false
    @State var newSession: Session = Session(running: false, startTime: .now, editedTimestamp: .now)
    @State var clockCount = 0

    @State var sessionModalPageShowing = false

    @State var timer: Timer?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    ForEach(sessions.filter { $0.endTime != nil }) { session in
                        NavigationLink(destination: showSessionDetails(session: session)) {
                            sessionsListItem(session: session)
                        }
                        .flippedUpsideDown()
                    }
                }
                .listStyle(.grouped)
                .frame(maxWidth: .infinity)
                .defaultScrollAnchor(.top)
                .flippedUpsideDown()
                .ignoresSafeArea()

                .background(.gray)

                HStack {
                    if timerIsRunning == false {
                        Image(systemName: "play.circle.fill")
                            .onTapGesture {
                                startTimer()
                            }
                            .font(.largeTitle)
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "stop.circle.fill")
                            .padding(0)
                            .onTapGesture {
                                stopTimer()
                            }
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    Spacer()

                    VStack(alignment: .trailing) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(customColors[newSession.client?.color ?? "None"])
                                .shadow(radius: 3)
                            Text("\(secondsToFullTime(newSession.secondsElapsed ?? 0))")
                                .monospaced()
                                .font(.system(size: 24))
                        }
                        HStack {
                            Text("\(newSession.client?.name ?? "No Client Selected")")
                                .font(.footnote)
                        }
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    sessionModalPageShowing = true
                }
                .sheet(isPresented: self.$sessionModalPageShowing) {
                    newSessionModal(session: newSession, sessionCache: newSession, stopTimer: stopTimer)
                }
                .padding()
                .border(width: 1, edges: [.top], color: .gray.opacity(0.5))
            }
        }
    }

    func startTimer() {
        timerIsRunning = true

        newSession.running = true
        newSession.startTime = .now

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            clockCount = Int(Date.now.timeIntervalSince(newSession.startTime))
            newSession.secondsElapsed = clockCount
        }
    }

    func stopTimer() {
        timerIsRunning = false

        newSession.running = true
        newSession.endTime = .now

        modelContext.insert(newSession)

        timer?.invalidate()
        newSession = Session(running: false, startTime: .now, secondsElapsed: 0, editedTimestamp: .now)
        clockCount = 0
    }
}

#Preview {
    ContentView()
        .environmentObject(LocalNotificationManager())
        .modelContainer(SampleData.shared.modelContainer)
}
