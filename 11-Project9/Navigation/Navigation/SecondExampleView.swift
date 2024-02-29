//
//  SecondExampleView.swift
//  Navigation
//
//  Created by HubertMac on 29/02/2024.
//

import SwiftUI

//Programmatic navigation with NavigationStack

struct SecondExampleView: View {
    @State private var path =  [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                    print(path)
                }
                Button("Show 64") {
                    path.append(64)
                    print(path)
                }
                Button("Show 32 then 64") {
                    path = [32, 64]
                    print(path)
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    SecondExampleView()
}
