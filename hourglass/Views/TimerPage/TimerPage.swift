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
                .listStyle(.grouped)
                .frame(maxWidth: .infinity)
                .defaultScrollAnchor(.top)
                .flippedUpsideDown()
                .ignoresSafeArea()

                HStack {
                    if timerIsRunning == false {
                        Image(systemName: "play.circle.fill")
                            .onTapGesture {
                                startTimer()
                                Task {
                                    await scheduleNotification()
                                }
                            }
                            .font(.largeTitle)
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "stop.circle.fill")
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
                    newSessionModal(session: newSession, stopTimer: stopTimer)
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
        let remainingTime = Double(newSession.client!.timeAdded - newSession.client!.timeUsed)

        let secondThreshold = userSettingsValues.secondAlertThreshold
        let firstThreshold = userSettingsValues.firstAlertThreshold

        if alertsOn() {
            clientRemainingTime = Double(newSession.client!.timeAdded - newSession.client!.timeUsed - userSettingsValues.firstAlertThreshold)
            print("clientRemainingTime \(String(describing: clientRemainingTime))")
            if Int(remainingTime) > secondThreshold {
                print("remainingTime \(remainingTime)")
                print("secondThreshold \(secondThreshold)")
                let secondNotification = LocalNotification(
                    identifier: UUID().uuidString,
                    title: "Second Alert",
                    body: "\(newSession.client?.name ?? "") has \(secondThreshold) left",
                    timeInterval: clientRemainingTime ?? 1.0,
                    repeats: false)
                await localNotificationsManager.schedule(localNotification: secondNotification)
            } else {
                let firstNotification = LocalNotification(
                    identifier: UUID().uuidString,
                    title: "First Alert",
                    body: "\(newSession.client?.name ?? "") has \(firstThreshold) left",
                    timeInterval: clientRemainingTime ?? 1.0,
                    repeats: false)
                await localNotificationsManager.schedule(localNotification: firstNotification)
            }
        }
    }

    func alertsOn() -> Bool {
        if newSession.client == nil {
            print("newSession.client is nil")
            return false
        }
        if !userSettingsValues.switchAlert1 || !userSettingsValues.switchAlert2 {
            print("userSettingsValues.switchAlert1 or userSettingsValues.switchAlert2 is false")
            return false
        }
        if newSession.client!.timeAdded - newSession.client!.timeUsed - userSettingsValues.firstAlertThreshold > 0 {
            print("newSession.client!.timeAdded - newSession.client!.timeUsed - userSettingsValues.firstAlertThreshold > 0")
            return false
        } else {
            print("return true")
            return true
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LocalNotificationManager())
        .modelContainer(SampleData.shared.modelContainer)
}
