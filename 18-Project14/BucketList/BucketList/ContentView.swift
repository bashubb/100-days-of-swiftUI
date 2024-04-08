//
//  ContentView.swift
//  BucketList
//
//  Created by HubertMac on 08/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Write and Read") {
            let manager = FileManager()
            manager.write(pathName: "message", content: "My Message")
            
            let message = manager.read(type: String.self, pathName: "message")
            print(message)
        }
    }
    
    
}

#Preview {
    ContentView()
}
