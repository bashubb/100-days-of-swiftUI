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
            SortableProspects(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            SortableProspects(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            
            SortableProspects(filter: .uncontacted)
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
