//
//  ViewComposition.swift
//  ViewsAndModifiers
//
//  Created by HubertMac on 30/01/2024.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct ViewComposition: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
                
        }
    }
}

#Preview {
    ViewComposition()
}
