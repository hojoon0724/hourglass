//
//  timerModels.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/9/24.
//

import Foundation
import SwiftUI

class timerClass: ObservableObject {
    // on-off switch
    @Published var timerRunning = false

    // main count - all data derives from here
    @Published var secondsElapsed = 0

    @Published var hr = 0
    @Published var min = 0
    @Published var sec = 0

    var timer: Timer?

    func timerStart() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsElapsed += 1
        }
    }

    func timerStop() {
        timerRunning = false
        print(secondsElapsed)
        print("Timer OFF")
        timer?.invalidate()
        secondsElapsed = 0
        print(secondsElapsed)
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
