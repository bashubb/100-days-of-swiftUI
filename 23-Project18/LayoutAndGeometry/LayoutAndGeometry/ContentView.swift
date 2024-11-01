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
        GeometryReader { geo in
            Rectangle()
                .fill(.red)
                .frame(width: geo.size.width * 0.8, height: geo.size.width * 0.8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .frame(width: geo.size.width, height: geo.size.height)
        }
        
    }
}

#Preview {
    ContentView()
}
