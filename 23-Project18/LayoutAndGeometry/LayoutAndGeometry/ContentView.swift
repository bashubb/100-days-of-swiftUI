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

//struct ContentView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Hello, world!")
//                .alignmentGuide(.leading) { d in
//                    d[.trailing]
//                }
//            Text("This is a longer, line of text")
//        }
//        .background(.red)
//        .frame(width: 400, height: 400)
//        .background(.blue)
//    }
//}
//
//#Preview {
//    ContentView()
//}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number\(position)")
                    .alignmentGuide(.leading) { dimension in
                        Double(position) * -10
                    }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
