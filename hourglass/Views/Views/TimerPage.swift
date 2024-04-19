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
    @State private var show_modal_project: Bool = false

    @State var clock: Int = 0

//    @ObservedObject var timerClass: timerClass

    @State var timer: Timer?

    var body: some View {
        VStack(spacing: 0, content: {
            // Time Log Area
            ScrollView {
                VStack(spacing: 0, content: {
                    // Replace with data - maybe refactor as component
                    ForEach(sessions) { session in
                        HStack {
                            HStack(content: {
                                Image(systemName: "circle.fill")
                                    // change color to variable
                                    .foregroundColor(.red)
                                    .padding(.trailing, 10)

                                VStack(alignment: .leading, content: {
                                    Text("\(session.startTime.formatted(date: .numeric, time: .standard))")
                                    Text(session.client != nil ? "\(session.client!.name)" : "")
                                        .font(.caption)
                                })
                            })
                            Spacer()
                            Text(session.secondsElapsed != nil ? secondsToFullTime(session.secondsElapsed!) : "Running")
                                .monospaced()
                        }
                        .padding()
                    }
                    .flippedUpsideDown()
                })
            }
            .frame(maxWidth: .infinity)
            .defaultScrollAnchor(.top)
            .flippedUpsideDown()

            // Button + Timer - Refactor as component
//            Button(action: { self.show_modal_project = true }, label: {
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
                        Text("Project Name - Client").font(.footnote)

                    })
                })
            })
            .padding()
            .sheet(isPresented: self.$show_modal_project) {
                projectAddModal()

                // Spacer between timer and TabView
            }
        })
        Spacer().frame(height: 10)
//        })
    }

    func startSession() {
        print("Session START")
        newSession = Session(running: true, startTime: .now, editedTimestamp: .now)
        print(newSession.running)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            clock = Int(
                Date.now.timeIntervalSince(newSession.startTime)
            )
            print(Date.now)
            print(clock)
        }
    }

    func stopSession() {
        print("Session STOP")
        newSession.running = false
        newSession.endTime = .now
        newSession.secondsElapsed = Int((newSession.endTime?.timeIntervalSince(newSession.startTime))!)
        timer?.invalidate()
        print(newSession.running)
        print(newSession.secondsElapsed!)
        print(newSession.startTime)
        print(newSession.endTime!)
        modelContext.insert(newSession)
        clock = 0
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
