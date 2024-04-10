//
//  Timer.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftUI

let collection: Array = ["1", "2", "3", "4", "5"]

struct Timer: View {
    @State var timerState: Bool = false
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Text("Project Name")
                    Spacer()
                    Text("00:00:00")
                }.padding()
                HStack {
                    Text("Project Name")
                    Spacer()
                    Text("00:00:00")
                }.padding()
                HStack {
                    Text("Project Name")
                    Spacer()
                    Text("00:00:00")
                }.padding()
                HStack {
                    Text("Project Name")
                    Spacer()
                    Text("00:00:00")
                }.padding()
                HStack {
                    Text("Project Name")
                    Spacer()
                    Text("00:00:00")
                }.padding()
                HStack {
                    Text("Project Name")
                    Spacer()
                    Text("00:00:00")
                }.padding()
            }

//            Rectangle()
//                .fill(Color.black)
//                .frame(height: 1)

            HStack(content: {
                if timerState == true {
                    Button(action: stopTimer) {
                        Image(systemName: "stop.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.red)
                } else {
                    Button(action: startTimer) {
                        Image(systemName: "play.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.green)
                }
                Spacer()

                Text("00:00:00")
                    .monospaced()
                    .font(.title)
            })
            .padding()
//            .border(Color.black)

//            Rectangle()
//                .fill(Color.black)
//                .frame(height: 1)

            Spacer().frame(height: 10)
        }
    }

    func stopTimer() {
        print("Timer Stopped")
        timerState = false
    }

    func startTimer() {
        print("Timer Running")
        timerState = true
    }
}

#Preview {
    ContentView(selectedTab: "Timer")
}
