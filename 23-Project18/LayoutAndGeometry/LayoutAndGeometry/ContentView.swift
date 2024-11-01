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

struct OuterView: View {
    var body: some View {
        VStack {
            Text("top")
            
            InnerView()
                .background(.green)
            
            Text("bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { proxy in
                Text("Centre")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print("Custom center: \(proxy.frame(in: .named("custom")).midX) x \(proxy.frame(in: .named("custom")).midY)")
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
                              
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}

struct ContentView: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "custom")
        
    }
}

#Preview {
    ContentView()
}
