//
//  bottomScrollView.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/9/24.
//

import SwiftUI

struct BottomScrollView: View {
    
    struct Message: Identifiable {
        let id = UUID()
        let text: String
    }

    @State private var messages: [Message] = [
        Message(text: "First message"),
        Message(text: "Second message"),
        Message(text: "Third message"),
        Message(text: "Fourth message"),
        Message(text: "Fifth message"),
        Message(text: "Sixth message"),
        Message(text: "Seventh message")
    ]
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView {
                ForEach(messages) { message in
                    Text(message.text)
                        .id(message.id)
                }
            }
            .onAppear {
                value.scrollTo(messages.last?.id)
            }
            .onChange(of: messages.count) { _, _ in
                value.scrollTo(messages.last?.id)
            }
        }
        .frame(height: 50)
    }
}


#Preview {
    BottomScrollView()
}
