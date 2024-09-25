//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by HubertMac on 27/06/2024.
//

/*
 1. A parent view proposes a size for its child.
 2. Based on that information, the child then chooses its own size and the parent must respect that choice.
 3. The parent then positions the child in its coordinate space.*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world")
            .padding(20)
            .background(.red)
    }
}

#Preview {
    ContentView()
}
