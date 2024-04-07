import UIKit

var greeting = "Hello, playground"

let formatter = DateComponentsFormatter()
formatter.allowedUnits = [.hour, .minute, .second]
formatter.unitsStyle = .positional
let timeInterval: TimeInterval = 9754

let formattedDuration = formatter.string(from: timeInterval)

struct Time {
  let hour: Int
  let minute: Int
  let second: Int
}

func convertToSec(_ hour: Int, _ minute: Int, _ second: Int) -> Int {
  var hourInSec = hour * 60 * 60
  var minuteInSec = minute * 60
  return hourInSec + minuteInSec + second
}

// var addition = Time(hours: 4, minutes: 20, seconds: 30)

convertToSec(2, 20, 45)

var seconds = 8445

var remainingSec = seconds % 60
var secToMin = (seconds - remainingSec) / 60
var remainingMin = secToMin % 60
var minutesToHours = (secToMin - remainingMin) / 60

var timeStruct = Time(hour: minutesToHours, minute: remainingMin, second: remainingSec)

print(timeStruct)
print(timeStruct.hour)
print(timeStruct.minute)
print(timeStruct.second)

print(formattedDuration as Any)

var rate = 90
var perSec = Double(6400) / 3600
print(String(format: "%.2f", perSec))

print(String(format: "%02d", 32988))

var d: Duration = .seconds(3)
d += .milliseconds(33)
print(d)


