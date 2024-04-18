//
//  TimeScratchView.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/16/24.
//

import SwiftData
import SwiftUI

struct TimeScratchView: View {
    var timer: Timer?
    let formatter = DateFormatter()

    @Bindable var time: Session
    @Environment(\.modelContext) private var modelContext
    @State var newTime = Session(running: false, startTime: .now, endTime: nil, secondsElapsed: nil, editedTimestamp: .now)

    @State var counter = 0

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: stopTime, label: {
                    Text("Stop")
                })
                Spacer()
                Button(action: startTime, label: {
                    Text("Start")
                })
                Spacer()
            }
            Spacer()
            Text(String(newTime.running))
            Text(newTime.startTime.formatted(date: .abbreviated, time: .standard))
            Text(newTime.endTime != nil ? "\(newTime.endTime!.formatted(date: .abbreviated, time: .standard))" : "")
            Text(String(newTime.secondsElapsed ?? 0))
            Spacer()
            Spacer()
        }
    }

    private func startTime() {
        print("STARTED")

        newTime.running = true
        newTime.startTime = .now
        newTime.endTime = nil
        newTime.secondsElapsed = nil

        print("\(newTime.running)/\(newTime.startTime)/\(String(describing: newTime.endTime))/\(String(describing: newTime.secondsElapsed))")
        //        modelContext.insert(newTime)
    }

    mutating func calculateSecondsElapsed() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            print("timer running")
//            counter = Int(Date.now.timeIntervalSince(newTime.startTime))
        }
    }

    private func stopTime() {
        print("STOPPED")
        newTime.running = false
        newTime.endTime = .now
        newTime.secondsElapsed = Int((newTime.endTime?.timeIntervalSince(newTime.startTime))!)

        print("\(newTime.running)/\(newTime.startTime)/\(String(describing: newTime.endTime))/\(String(newTime.secondsElapsed ?? 0))")
    }
}

#Preview {
    TimeScratchView(time: SampleData.shared.session)
}
