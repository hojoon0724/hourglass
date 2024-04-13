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

secondsToHoursMinutesSeconds(87928)[0]
secondsToHoursMinutesSeconds(87928)[1]
secondsToHoursMinutesSeconds(87928)[2]

print(Date())

let filteredArray = allProjects.filter { $0.clientId == "E893AF78-7C9C-4417-A1DC-F97B82DD7A57" }

filteredArray.forEach { project in
    print(project.name, project.clientId)
}

// allProjects.forEach { project in
//    print(project.name, project.clientId)
// }
