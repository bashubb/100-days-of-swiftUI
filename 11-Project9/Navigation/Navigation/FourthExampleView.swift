//
//  FourthExampleView.swift
//  Navigation
//
//  Created by HubertMac on 29/02/2024.
//

import SwiftUI

// How to make a NavigationStack return to its root view programmatically

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar{
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct FourthExampleView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    FourthExampleView()
}

