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

    @StateObject private var userSettingsValues = UserSettingsValues.shared
    @EnvironmentObject var localNotificationsManager: LocalNotificationManager

    @Query(sort: \Session.startTime, order: .reverse) private var sessions: [Session]
    @Query(sort: \Client.name) private var clients: [Client]

    @State var timerIsRunning = false
    @State var newSession: Session =
        Session(
            running: false,
            startTime: .now,
            secondsElapsed: 0,
            editedTimestamp: .now
        )
    @State var clockCount = 0

    @State var clientRemainingTime: Double?
    @State var clientSelected: Bool = false

    @State var sessionModalPageShowing = false

    @State var timer: Timer?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    ForEach(sessions.filter { $0.endTime != nil }) { session in
                        NavigationLink(destination: showSessionDetails(session: session)) {
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
                            //                            sessionsListItem(session: session)
                        }
                        .flippedUpsideDown()
                    }
                }
                .frame(maxWidth: .infinity)
                .defaultScrollAnchor(.top)
                .flippedUpsideDown()
                .ignoresSafeArea()
                .listStyle(.grouped)

                HStack {
                    if timerIsRunning == false {
                        Image(systemName: "play.circle.fill")
                            .onTapGesture {
                                startTimer()
                                Task {
                                    await scheduleNotification()
                                }
                            }
                            .foregroundColor(.green)
                        #if os(visionOS)
                            .font(.extraLargeTitle)
                            .padding()
                        #else
                            .font(.largeTitle)
                        #endif
                    } else {
                        Image(systemName: "stop.circle.fill")
                            .onTapGesture {
                                stopTimer()
                            }
                            .foregroundColor(.red)
                        #if os(visionOS)
                            .padding()
                        #else
                            .font(.largeTitle)
                        #endif
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
                    #if os(visionOS)
                    .padding()
                    #endif
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    sessionModalPageShowing = true
                }
                .sheet(isPresented: self.$sessionModalPageShowing) {
                    newSessionModal(session: newSession, stopTimer: stopTimer)
                }
                #if os(visionOS)
                .padding(20)
                #else
                .padding()
                #endif
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

        newSession.running = false
        newSession.endTime = .now

        modelContext.insert(newSession)
        try? modelContext.save()

        timer?.invalidate()
        newSession = Session(running: false, startTime: .now, secondsElapsed: 0, editedTimestamp: .now)
        clockCount = 0

        localNotificationsManager.removeRequest()
        //        print(localNotificationsManager.schedule)
    }

    func scheduleNotification() async {
        let firstThreshold = userSettingsValues.firstAlertThreshold
        let secondThreshold = userSettingsValues.secondAlertThreshold

        if alertsOn() {
            let remainingTime = Int(newSession.client!.timeAdded - newSession.client!.timeUsed)

            let timeToFirstThreshold = Double(remainingTime - firstThreshold)
            let timeToSecondThreshold = Double(remainingTime - secondThreshold)

            if timeToFirstThreshold > 0 {
                let firstNotification = LocalNotification(
                    identifier: UUID().uuidString,
                    title: "First Alert",
                    body: "\(newSession.client?.name ?? "")'s account has \(secondsToFullTime(firstThreshold)) left",
                    timeInterval: timeToFirstThreshold,
                    repeats: false)
                await localNotificationsManager.schedule(localNotification: firstNotification)
            }
            if secondAlertOn() {
                if timeToSecondThreshold > 0 {
                    let secondNotification = LocalNotification(
                        identifier: UUID().uuidString,
                        title: "Second Alert",
                        body: "\(newSession.client?.name ?? "")'s account has \(secondsToFullTime(secondThreshold)) left",
                        timeInterval: timeToSecondThreshold,
                        repeats: false)
                    await localNotificationsManager.schedule(localNotification: secondNotification)
                }
            }
        }
    }

    func alertsOn() -> Bool {
        if newSession.client == nil {
            return false
        }

        if firstAlertOn() == false {
            return false
        }

        if newSession.client!.timeAdded - newSession.client!.timeUsed - userSettingsValues.firstAlertThreshold < 0 {
            return false
        } else {
            return true
        }
    }

    func firstAlertOn() -> Bool {
        if !userSettingsValues.switchAlert1 {
            return false
        } else {
            return true
        }
    }

    func secondAlertOn() -> Bool {
        if !userSettingsValues.switchAlert2 {
            return false
        } else {
            return true
        }
    }
}

#if os(visionOS)
    #Preview(windowStyle: .automatic, traits: .fixedLayout(width: 600, height: 1000)) {
        ContentView()
            .environmentObject(LocalNotificationManager())
            .environmentObject(ColorSchemeManager())
            .modelContainer(SampleData.shared.modelContainer)
    }
#else
    #Preview {
        ContentView()
            .environmentObject(LocalNotificationManager())
            .environmentObject(ColorSchemeManager())
            .modelContainer(SampleData.shared.modelContainer)
    }
#endif
