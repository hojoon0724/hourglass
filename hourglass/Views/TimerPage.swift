//
//  Timer.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftUI

let collection: Array = ["1", "2", "3", "4", "5"]

struct TimerPage: View {
    @ObservedObject var timerClass: timerClass

    var body: some View {
        VStack {
            Spacer()

            ///
            ///
            ScrollView {
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
                        Text("00:00:01")
                    }.padding()
                }
            }
            ///

//            Rectangle()
//                .fill(Color.black)
//                .frame(height: 1)

            HStack(content: {
                if timerClass.timerRunning == true {
                    Button(action: timerClass.timerStop) {
                        Image(systemName: "stop.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.red)
                } else {
                    Button(action: timerClass.timerStart) {
                        Image(systemName: "play.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.green)
                }
                Spacer()

                Text(
                    "\(String(format: "%02d", timerClass.hr)):\(String(format: "%02d", timerClass.min)):\(String(format: "%02d", timerClass.sec))")
                    .monospaced()
                    .font(.system(size: 24))
            })
            .padding()
//            .border(Color.black)

//            Rectangle()
//                .fill(Color.black)
//                .frame(height: 1)

            Spacer().frame(height: 10)
        }
    }
}

#Preview {
    ContentView()
}
