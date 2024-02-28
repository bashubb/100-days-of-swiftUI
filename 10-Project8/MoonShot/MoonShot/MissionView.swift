//
//  MissionView.swift
//  MoonShot
//
//  Created by HubertMac on 28/02/2024.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                VStack(alignment: .leading) {
                    Text("Mission HighLights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] =  Bundle.main.decode("missions.json")
    return MissionView(mission: missions[0])
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
