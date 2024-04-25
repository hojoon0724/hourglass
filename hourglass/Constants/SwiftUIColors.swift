//
//  SwiftUIColors.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/25/24.
//

import SwiftUI

struct SwiftUIColors: View {
    var body: some View {
        List {
//            Text("White")
//                .listRowBackground(Color(UIColor.systemGray6)
//            Text("(UIColor.systemGray)")
//                .listRowBackground(Color(UIColor.systemGray))
//            Text("(UIColor.systemGray2)")
//                .listRowBackground(Color(UIColor.systemGray2))
//            Text("(UIColor.systemGray3)")
//                .listRowBackground(Color(UIColor.systemGray3))
//            Text("(UIColor.systemGray4)")
//                .listRowBackground(Color(UIColor.systemGray4))
//            Text("(UIColor.systemGray5)")
//                .listRowBackground(Color(UIColor.systemGray5))
//            Text("(UIColor.systemGray6)")
//                .listRowBackground(Color(UIColor.systemGray6))
//            Text("(UIColor.red)")
//                .listRowBackground(Color(UIColor.red))
//            Text(".red")
//                .listRowBackground(Color.red)
//            Text("(UIColor.cyan)")
//                .listRowBackground(Color(UIColor.cyan))
//            Text("(UIColor.systemCyan)")
//                .listRowBackground(Color(UIColor.systemCyan))
//            Text(".cyan")
//                .listRowBackground(Color.cyan)
//            Text("(UIColor.orange)")
//                .listRowBackground(Color(UIColor.orange))
//            Text(".orange")
//                .listRowBackground(Color.orange)
//            Text(".yellow")
//                .listRowBackground(Color.yellow)
//            Text("(UIColor.yellow)")
//                .listRowBackground(Color(UIColor.yellow))

            ForEach(colorArray, id: \.self) { color in
                HStack {
                    Image(systemName: "circle.fill")
                        // change color to variable
                        .foregroundColor(customColors[color]!)
                        .padding(.trailing, 10)
                        .shadow(radius: 3)
                    Text("\(color)")
                        .textCase(.none)
                }
//                    .listRowBackground(customColors[color]!)
            }
        }
        .onAppear { print(colorArray) }
    }
}

#Preview {
    SwiftUIColors()
}
