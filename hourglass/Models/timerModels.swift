//
//  timerModels.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/9/24.
//

import Foundation
import SwiftData

class timerClass: ObservableObject {
    // on-off switch
    @Published var timerRunning = false

    // main count - all data derives from here
    @Published var secondsElapsed = 0

    @Published var hr = 0
    @Published var min = 0
    @Published var sec = 0

    @Published var startTime: Date?
    @Published var endTime: Date?

    @Published var timeDiff: Double?

    var timer: Timer?

    func timerStart() {
        startTime = Date()
        print(startTime!)
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsElapsed += 1
        }
        print("Timer ON")
    }

    func timerStop() {
        timerRunning = false
        endTime = Date()
        print(endTime!)
        timeDiff = endTime!.timeIntervalSince(startTime!)
        print("time dif: \(timeDiff!)")
        print(secondsElapsed)
        print("Timer OFF")
        timer?.invalidate()
    }

    //    func fullTimeToSeconds(_ hour: Int, _ minute: Int, _ second: Int) -> Int {
    //        let hourInSec = hour * 60 * 60
    //        let minuteInSec = minute * 60
    //        return hourInSec + minuteInSec + second
    //    }
    //
    //    func secondsToFullTime(_ seconds: Int) {
    //        hr = seconds / 3600
    //        min = (seconds % 3600) / 60
    //        sec = (seconds % 3600) % 60
    //        print("sec2FT", hr, min, sec)
    //    }
}
