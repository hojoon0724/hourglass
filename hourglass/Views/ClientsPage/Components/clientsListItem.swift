//
//  clientsListItem.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/20/24.
//

import SwiftData
import SwiftUI

struct clientsListItem: View {
    // not using because the colors don't re-render when changed and then canceled
    @Environment(\.colorScheme) var colorScheme

    @Bindable var client: Client

    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .foregroundColor(customColors[client.color])
                .shadow(radius: 3)
            Text("\(client.name)")
            Spacer()
            Text(secondsToFullTime(client.timeAdded - client.timeUsed))
                .monospaced()
        }
    }
}

#Preview {
    List {
        clientsListItem(client: SampleData.shared.client)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
