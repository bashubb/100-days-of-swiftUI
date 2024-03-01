//
//  ContentView.swift
//  Project9_challenge3
//
//  Created by HubertMac on 01/03/2024.
//


import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isGridLayout = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if isGridLayout {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                } else {
                    ListLayoutView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationDestination(for: Mission.self) { selection in
                MissionView(mission: selection, astronauts: astronauts)
            }
            .toolbar {
                Button{
                    withAnimation {
                        isGridLayout.toggle()
                    }
                } label: {
                    Image(systemName: isGridLayout ? "list.bullet" : "square.grid.3x3" )
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}


