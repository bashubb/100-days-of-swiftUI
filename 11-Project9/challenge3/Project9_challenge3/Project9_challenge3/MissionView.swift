//
//  MissionView.swift
//  MoonShot
//
//  Created by HubertMac on 28/02/2024.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                
                //challenge1
                if let date = mission.launchDate {
                    Label(date.formatted(date: .complete, time: .omitted), systemImage: "calendar")
                }
                
                VStack(alignment: .leading) {
                    //challenge2
                    CustomDivider()
                    
                    Text("Mission HighLights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    //challenge2
                    CustomDivider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                //challenge2
                CrewRoster(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] =  Bundle.main.decode("missions.json")
    let astrounauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[1], astronauts: astrounauts)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
