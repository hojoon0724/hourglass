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
      VStack(alignment: .leading) {
        Text("Project")
          .multilineTextAlignment(.leading)
        Text("00:00:00")
          .multilineTextAlignment(.leading)
      }
      Spacer()
    })
  }
}

#Preview {
  Project()
}
