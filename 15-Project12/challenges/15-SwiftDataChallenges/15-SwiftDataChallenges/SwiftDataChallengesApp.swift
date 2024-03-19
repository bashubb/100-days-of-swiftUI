//
//  _5_SwiftDataChallengesApp.swift
//  15-SwiftDataChallenges
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataChallengesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Expense.self)
        }
    }
}
