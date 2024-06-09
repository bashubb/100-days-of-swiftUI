//
//  EditProspectView.swift
//  HotProspects
//
//  Created by HubertMac on 09/06/2024.
//

import SwiftUI

struct EditProspectView: View {
    @Environment(\.dismiss) var dismiss
    var prospect: Prospect
    @State private var name: String
    @State private var emailAddress: String
    @State private var isContacted: Bool
    @FocusState var nameIsFocused
    @FocusState var emailIsFocused
    
    var body: some View {
        Form {
            TextField("name", text: $name)
                .padding(5)
                .focused($nameIsFocused)
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(nameIsFocused ? .orange : .secondary)
                )
            TextField("emailAdress", text: $emailAddress)
                .padding(5)
                .focused($emailIsFocused)
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(emailIsFocused ? .orange : .secondary)
                )
            Toggle("Contacted", isOn: $isContacted)
        }
        .navigationTitle("Edit Prospect")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    prospect.name = name
                    prospect.emailAddress = emailAddress
                    prospect.isContacted = isContacted
                    dismiss()
                }
            }
        }
    }
    
    init(prospect: Prospect) {
        self.prospect = prospect
        _name = State(initialValue: prospect.name)
        _emailAddress = State(initialValue: prospect.emailAddress)
        _isContacted = State(initialValue: prospect.isContacted)
    }
}

//#Preview {
//    EditProspectView(prospect: Prospect(name: "John", emailAddress: "john@john.com", isContacted: false))
//
//}
