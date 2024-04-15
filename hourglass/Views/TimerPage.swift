//
//  Timer.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftUI

struct TimerPage: View {
    @State private var show_modal_project: Bool = false
    @ObservedObject var timerClass: timerClass

    var body: some View {
        VStack(spacing: 0, content: {
            // Time Log Area
            ScrollView {
                VStack(spacing: 0, content: {
                    // Replace with data - maybe refactor as component
                    ForEach((0 ..< 4).reversed(), id: \.self) { i in
                        HStack {
                            HStack(content: {
                                Image(systemName: "circle.fill")
                                    // change color to variable
                                    .foregroundColor(.red)
                                    .padding(.trailing, 10)

                                VStack(alignment: .leading, content: {
                                    Text("Project Name \(i)")
                                    Text("Client").font(.caption)
                                })
                            })
                            Spacer()

                            Text("00:00:00")
                        }
                        .padding()
                    }
                    .flippedUpsideDown()
                })
            }
            .frame(maxWidth: .infinity)
            .defaultScrollAnchor(.top)
            .flippedUpsideDown()

            // Button + Timer - Refactor as component
            Button(action: { self.show_modal_project = true }, label: {
                HStack(content: {
                    // Button - Dynamic
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

                    // Timer + Project Details

                    VStack(alignment: .trailing, content: {
                        HStack(content: {
                            Image(systemName: "circle.fill")
                                // change color to variable
                                .foregroundColor(.red)
                            Text(
                                "\(secondsToFullTime(timerClass.secondsElapsed))")
                                .monospaced()
                                .font(.system(size: 24))

                        })

                        HStack(content: {
                            Text("Project Name - Client").font(.footnote)

                        })
                    })
                })
                .padding()
                //                .background(Color.blue)
                .sheet(isPresented: self.$show_modal_project) {
                    projectAddModal()

                    // Spacer between timer and TabView
                }
            })
            Spacer().frame(height: 10)
        })
    }
}

#Preview {
    ContentView()
}
