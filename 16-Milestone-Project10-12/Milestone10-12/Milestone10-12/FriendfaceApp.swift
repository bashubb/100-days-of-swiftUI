//
//  Milestone10_12App.swift
//  Milestone10-12
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
