//
//  timeConversionFunctions.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import Foundation

func fullTimeToSeconds(_ hour: Int, _ minute: Int, _ second: Int) -> Int {
    let hourInSec = hour * 60 * 60
    let minuteInSec = minute * 60
    return hourInSec + minuteInSec + second
}

func secondsToFullTime(_ intakeSeconds: Int) -> String {
    let workingSeconds = abs(intakeSeconds)
    let hr = convertToTwoDigits(workingSeconds / 3600)
    let min = convertToTwoDigits((workingSeconds % 3600) / 60)
    let sec = convertToTwoDigits((workingSeconds % 3600) % 60)
    let returnString = "\(hr):\(min):\(sec)"

    return intakeSeconds < 0 ? ("-" + returnString) : returnString
}

func convertToTwoDigits(_ number: Int) -> String {
    return String(format: "%02d", number)
}
