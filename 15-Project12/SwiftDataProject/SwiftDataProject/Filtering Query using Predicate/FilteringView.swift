//
//  FilteringView.swift
//  SwiftDataProject
//
//  Created by HubertMac on 17/03/2024.
//

import SwiftData
import SwiftUI

struct FilteringView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R") &&
        user.city == "London"
    },sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    let first  = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second  = User(name: "Rosa Diaz", city:"New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name:"Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}


#Preview {
    FilteringView()
}
