//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by HubertMac on 30/01/2024.
//

import SwiftUI

struct ConditionalModifiers: View {
    @State private var useRedText = false
    var body: some View {
        Button("Hello World") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
    }
}

#Preview {
    ConditionalModifiers()
}
