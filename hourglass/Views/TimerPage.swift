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
        VStack(spacing: 0, content: {
            ScrollView {
                VStack(spacing: 0, content: {
                    ForEach((0 ..< 4).reversed(), id: \.self) { i in
                        HStack {
                            
                            VStack(alignment: .leading, content: {
                                Text("Project Name \(i)")
                                Text("Client").font(.caption)
                            })
                            
                            Spacer()
                            
                            Text("00:00:00")
                        }
                        .padding()
                        //                        .background(Color.red)
                    }
                    .flippedUpsideDown()
                })
            }
            .frame(maxWidth: .infinity)
//            .background(Color.green)
            .defaultScrollAnchor(.top)
            .flippedUpsideDown()
            
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
            
            Spacer().frame(height: 10)
        }
        )}
}

#Preview {
    ContentView()
}
