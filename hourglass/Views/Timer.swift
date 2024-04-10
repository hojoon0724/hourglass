//
//  Timer.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftUI

let collection: Array = ["1", "2", "3", "4", "5"]

struct Timer: View {
    @ObservedObject var timerClass: timerClass

    var body: some View {
        VStack {
            Spacer()

            ///
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
            ///

//            Rectangle()
//                .fill(Color.black)
//                .frame(height: 1)

            HStack(content: {
                if timerClass.timerRunning == true {
                    Button(action: timerClass.timerOff) {
                        Image(systemName: "stop.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.red)
                } else {
                    Button(action: timerClass.timerOn) {
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
}

#Preview {
    ContentView(selectedTab: "Timer")
}
