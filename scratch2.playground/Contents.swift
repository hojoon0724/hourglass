import SwiftData
import SwiftUI

var greeting = "Hello, playground"



func secondsToHoursMinutesSeconds(_ seconds: Int) -> [Int] {
    var hours = seconds / 3600
    var minutes = (seconds % 3600) / 60
    var seconds = (seconds % 3600) % 60
    var TimeArray = [hours, minutes, seconds]

    return TimeArray
}

// let (h, m, s) = secondsToHoursMinutesSeconds(27005)

func showTwoDigits(_ number: Int) -> (String) {
    return (String(format: "%02d", number))
}

secondsToHoursMinutesSeconds(87928)
