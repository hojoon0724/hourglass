//
//  newClientModal.swift
//  Hourglass
//
//  Created by Hojoon Kim on 6/20/24.
//

import SwiftUI

struct newClientModal: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var newClient: Client = Client(name: "", color: "None", active: true)

    @State var confirmationShow: Bool = false

    var colorList: Array = colorArray

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Client")) {
                    HStack(alignment: .center, content: {
                        Text("Name")
                        TextField("Name", text: $newClient.name, prompt: Text("Required"))
                            .multilineTextAlignment(.trailing)
                            .textInputAutocapitalization(.words)
                            .disableAutocorrection(true)
                    })
                    HStack {
                        Picker("Color", selection: $newClient.color) {
                            ForEach(colorList, id: \.self) { color in
                                NavigationStack {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(customColors[color])
                                            .padding(.trailing, 10)
                                            .shadow(radius: 3)
                                            .tag(color as String)
                                        Text(color)
                                    }
                                }
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("New Client")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        if newClient.name == "" {
                            dismiss()
                        } else {
                            confirmationShow = true
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        modelContext.insert(newClient)
                        dismiss()
                    }
                    .disabled(newClient.name == "" ? true : false)
                }
            }
        }
        .confirmationDialog("Are you sure?", isPresented: $confirmationShow) {
            Button("Yes, cancel it.", role: .destructive) {
                dismiss()
            }
        } message: {
            Text("Are you sure? This won't be saved.")
        }
    }
}

#Preview {
    NavigationStack {
        VStack {
            Spacer()
            Button("Show Modal") {
            }
            .padding()
        }
        .sheet(isPresented: .constant(true)) {
            newClientModal()
        }
    }
}
