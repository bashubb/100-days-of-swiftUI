//
//  ThirdExampleView.swift
//  Navigation
//
//  Created by HubertMac on 29/02/2024.
//

import SwiftUI

// Navigating to different data types using NavigationPath

struct ThirdExampleView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Selected Number \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Selected String \(i)", value: String(i))
                }
                NavigationLink("Select Joe", value: "Joe")
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                Button("Push Hello") {
                    path.append("hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You have selected int \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You have selected String \(selection)")
            }
        }
    }
}

#Preview {
    ThirdExampleView()
}
