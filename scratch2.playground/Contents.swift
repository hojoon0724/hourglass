import SwiftUI
import SwiftData

var greeting = "Hello, playground"

func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

let (h,m,s) = secondsToHoursMinutesSeconds(27005)

func showTwoDigits(_ number: Int) -> (String) {
  return (String(format: "%02d", number))
}

print(showTwoDigits(h))
