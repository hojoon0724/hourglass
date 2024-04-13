//
//  modalTest.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/9/24.
//

import SwiftUI

// this is what shows up from below
struct ModalView: View {
    var body: some View {
        Text("This is a modal")
    }
}

// page has the button that calls the modal
struct modalTest: View {
    @State private var show_modal: Bool = false

    var body: some View {
        Button(action: {
            print("Button Pushed")
            self.show_modal = true
        }) {
            Text("Show Modal")
        }.sheet(isPresented: self.$show_modal) {
            projectAddModal()
        }
    }
}


#Preview {
    modalTest()
}
