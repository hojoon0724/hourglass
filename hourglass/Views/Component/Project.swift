//
//  Project.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/6/24.
//

import SwiftUI

struct Project: View {
    var body: some View {
        HStack(content: {
//      Image("")
//        .resizable()
//        .frame(width: 50, height: 50)
            HStack(alignment: .center) {
                Text("Project")
                    .multilineTextAlignment(.leading)
                Spacer()
                Text("00:00:00")
                    .monospaced()
                    .font(.callout)
                    .foregroundStyle(Color.red)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.yellow)
                    )
            }
        })
    }
}

#Preview {
    Project()
}
