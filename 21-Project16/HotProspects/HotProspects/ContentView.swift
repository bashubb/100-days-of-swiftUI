//
//  ContentView.swift
//  HotProspects
//
//  Created by HubertMac on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Prospects(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            Prospects(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            
            Prospects(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    ContentView()
}
