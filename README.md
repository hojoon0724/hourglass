# Project Hourglass

### Summary

Hourglass is a countdown time-tracking app that lets professionals working on an hourly billing basis (such as consultants, lawyers, tutors, freelancers, and contractors) to easily monitor the remaining time allocated to their clients or projects.

### Project Proposal

#### Origin:

This project began as a programming immersive course's capstone project that required self-learning a new programming language.

#### Swift:

Swift was chosen for its compatibility with the Apple ecosystem, with future plans to extend it to other Apple devices.

#### SwiftUI and Xcode:

The project will utilize SwiftUI to build the application's user interface and Xcode as the development environment, laying the groundwork for future expansion to other Apple devices.

#### Minimum Viable Product:

The Minimum Viable Product includes full CRUD functionality within the iOS application, allowing users to add a time duration to projects, start and stop a timer that automatically calculates the time spent and remaining time on the project, and view a summary page displaying the remaining times.

#### Extended Goals:

After MVP is met, extended functions include:

1. A conversion page where one can specify their hourly rate and the amount of money received to calculate the number of hours and apply it to the selected project.
2. Ability to set a "minimum hours remaining" that notifies the user that the project is approaching the time allocation.
3. Porting to other device platforms: iPadOS, macOS, watchOS, visionOS, and tvOS.
4. iCloud integration to backup and sync across devices.

### Data Models (WIP):

| client account | session         | time addition |
| -------------- | --------------- | ------------- |
| UUID           |                 |               |
| Name           |                 |               |
| Color          |                 |               |
| Active         |                 |               |
| sessions       | \[session]      |               |
|                | running         |               |
|                | startTime       |               |
|                | endTime         |               |
|                | secondsElapsed  |               |
|                | \[client]       |               |
|                | editedTimestamp |               |
|                |                 | timeStamp     |
|                |                 | timeAdded     |
|                |                 | rate          |
|                |                 | \[client]     |
|                |                 |               |
|                |                 |               |
|                |                 |               |

Note: the project data model has been abandoned because it wasn't very useful

## Views

| Name     | Contents                                                               |
| -------- | ---------------------------------------------------------------------- |
| Timer    | Entry view: choose the client/project, run the timer                   |
| Clients  | Show the list of your clients, tapping takes you to their summary page |
|          | -> Add hours to the client’s account                                   |
|          | -> Show the log for the selected account                               |
| Settings | Settings                                                               |

---

## Progress Notes

| Date       | Items   | Notes                                                                |
| ---------- | ------- | -------------------------------------------------------------------- |
| 2024-03-29 | Xcode   | Learned the fundamentals.                                            |
|            | Swift   | Learned the basics: arrays, loops, functions, arrays/dictionary, etc |
| 2024-03-30 | SwiftUI | Created a test layout, learned HStack, VStack, Views.                |
|            | SwiftUI | Learned to make tabs and menu lists.                                 |
|            | Swift   | Refactor blocks and how to reference them                            |
| 2024-04-01 | Swift   | Figured out how to make an API call and process the JSON             |
| 2024-04-06 | Project | Project approved                                                     |

#### Development Checklist

[x] Xcode basics
[x] Swift basics
[x] SwiftUI
[x] Data persistence
[x] API calls in Swift
[x] Program's Logic
[x] UI
[x] Animation
[x] User Testing
[x] Launch screen graphics
[ ] Data storage (CloudKit)

## UI Mockup

<img src="./hourglass/hourglass/Screenshots/2024-05-03-hourglass-01-timer.PNG">
