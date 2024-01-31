//
//  EnvironmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by HubertMac on 30/01/2024.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Huffelpuff")
            Text("Ravenclaw")
            Text("Slyterin")
        }
        .font(.title)
        
//        VStack {
//            Text("Gryffindor")
//                .blur(radius: 10) <- that won't work
//            Text("Huffelpuff")
//            Text("Ravenclaw")
//            Text("Slyterin")
//        }
//        .blur(radius: 5)
    }
}

#Preview {
    EnvironmentModifiers()
}
