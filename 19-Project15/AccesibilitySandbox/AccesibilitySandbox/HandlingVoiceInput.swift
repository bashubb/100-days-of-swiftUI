//
//  HandlingVoiceInput.swift
//  AccesibilitySandbox
//
//  Created by HubertMac on 22/04/2024.
//

import SwiftUI

struct HandlingVoiceInput: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fizgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    HandlingVoiceInput()
}
