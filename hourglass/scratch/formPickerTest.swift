//
//  formPickerTest.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import SwiftUI

struct formPickerTest: View {
    @State private var selected: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Picker("Client", selection: $selected) {
                    if selected == "" {
                        Text("")
                    }
                    ForEach(allTestClients, id: \.id) { client in
                        Text(client.name)
                    }
                }
                Button("Submit", action: {
                    print(selected)
                })
            }
        }
    }
}

#Preview {
    formPickerTest()
}
