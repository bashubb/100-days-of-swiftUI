//
//  DetailUserView.swift
//  Milestone10-12
//
//  Created by HubertMac on 29/03/2024.
//

import SwiftUI

struct DetailUserView: View {
    var user: User
    var body: some View {
        List{
            Section("About") {
                Text(user.about)
                    .padding(.vertical)
            }
            
            Section("Contact Details") {
                Text("Adress: \(user.address)")
                Text("Company: \(user.company)")
                Text("email: \(user.email)")
            }
            
            Section("Firends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
            
            
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let newUser = User.example
    return NavigationStack{
        DetailUserView(user: newUser)
    }
}
