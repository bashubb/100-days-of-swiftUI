//
//  ControllingTheAnimationStack.swift
//  Animations
//
//  Created by HubertMac on 21/02/2024.
//

import SwiftUI

struct ControllingTheAnimationStack: View {
    @State private var enabled = false
    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
    }
}

#Preview {
    ControllingTheAnimationStack()
}
