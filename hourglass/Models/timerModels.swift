//
//  timerModels.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/9/24.
//

import Foundation

class timerClass: ObservableObject {
    @Published var timerRunning = false
    @Published var timerCount = 0

    func timerOn() {
        timerRunning = true
        timerCount += 1
        print("Timer ON \(timerCount)")
    }

    func timerOff() {
        timerRunning = false
        print("Timer OFF")
    }
}
