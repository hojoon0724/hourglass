//
//  timeConversion.swift
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

func secondsToFullTime(_ seconds: Int) -> String {
    let hr = convertToTwoDigits(seconds / 3600)
    let min = convertToTwoDigits((seconds % 3600) / 60)
    let sec = convertToTwoDigits((seconds % 3600) % 60)
    return "\(hr):\(min):\(sec)"
}

func convertToTwoDigits(_ number: Int) -> String {
    return String(format: "%02d", number)
}
