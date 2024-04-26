//
//  setTimeComponent.swift
//  Hourglass
//
//  Created by Hojoon Kim on 4/25/24.
//

import SwiftUI

struct setTimeComponent: View {
    @State var hr: Double = 0
    @State var min: Double = 0

    var body: some View {
        HStack {
            TextFieldStepper(
                doubleValue: $hr,
                unit: "h",
                label: ""
            )

            TextFieldStepper(
                doubleValue: $min,
                unit: "m",
                label: "",
                maximum: 59
            )
        }
    }
}

#Preview {
    setTimeComponent()
}
