//
//  ContentView.swift
//  Project3Challenge3
//
//  Created by HubertMac on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blueTitle()
            
        }
        .padding()
    }
}

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func blueTitle() -> some View {
        modifier(LargeTitle())
    }
}

#Preview {
    ContentView()
}
