//
//  timerActions.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/15/24.
//

import Foundation
import SwiftData
import SwiftUI
//
// class timerActions: ObservableObject {
//    @Bindable var timerClass: timerClass
//
//    init(timerClass: timerClass) {
//        self.timerClass = timerClass
//    }
//
//    var timer: Timer?
//
//    func timerStart() {
//        timerClass.timerRunning = true
//        timerClass.startTime = Date()
//        print(timerClass.startTime!)
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            self.timerClass.secondsElapsed += 1
//        }
//    }
//
//    func timerStop() {
//        timerClass.endTime = Date()
//        print(timerClass.endTime!)
//        timerClass.calcDuration = timerClass.endTime?.timeIntervalSince(timerClass.startTime!)
//        print("duration: \(timerClass.calcDuration!)")
//        timerClass.timerRunning = false
//        print(timerClass.secondsElapsed)
//        print("Timer OFF")
//        timer?.invalidate()
//        timerClass.secondsElapsed = 0
//        print(timerClass.secondsElapsed)
//    }
//
//    func fullTimeToSeconds(_ hour: Int, _ minute: Int, _ second: Int) -> Int {
//        let hourInSec = hour * 60 * 60
//        let minuteInSec = minute * 60
//        return hourInSec + minuteInSec + second
//    }
//
//    func secondsToFullTime(_ seconds: Int) {
//        timerClass.hr = seconds / 3600
//        timerClass.min = (seconds % 3600) / 60
//        timerClass.sec = (seconds % 3600) % 60
//        print("sec2FT", timerClass.hr, timerClass.min, timerClass.sec)
//    }
// }
