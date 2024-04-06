# Project Hourglass

### Summary

Project Hourglass is a countdown time-tracking app that lets professionals working on an hourly billing basis (such as consultants, lawyers, tutors, freelancers, and contractors) to easily monitor the remaining time allocated to their clients or projects.

### Project Proposal

#### Origin:

This project began as a programming immersive course's capstone project that required self-learning a new programming language.

#### Swift:

Swift was chosen for its compatibility with the Apple ecosystem, with future plans to extend it to other Apple devices.

#### UIKit and Xcode:

The project will utilize UIKit to build the application's user interface and Xcode as the development environment, laying the groundwork for future expansion to other Apple devices.

#### Minimum Viable Product:

The Minimum Viable Product includes full CRUD functionality within the iOS application, allowing users to add a time duration to projects, start and stop a timer that automatically calculates the time spent and remaining time on the project, and view a summary page displaying the remaining times.

#### Extended Goals:

After MVP is met, extended functions include:

1. A conversion page where one can specify their hourly rate and the amount of money received to calculate the number of hours and apply it to the selected project.
2. Ability to set a "minimum hours remaining" that notifies the user that the project is approaching the time allocation.
3. Porting to other device platforms: iPadOS, macOS, watchOS, visionOS, and tvOS.
4. iCloud integration to backup and sync across devices.

### Data Models (WIP):

| account | project        | session       |
| ------- | -------------- | ------------- |
|         |                | \_id          |
|         | \_id           | project_id    |
| \_id    | account_id     | account_id    |
| name    | account_name   |               |
|         | time_allocated |               |
|         | time_remaining |               |
|         | name           | project_name  |
|         |                | start_time    |
|         |                | end_time      |
|         |                | modified_time |
