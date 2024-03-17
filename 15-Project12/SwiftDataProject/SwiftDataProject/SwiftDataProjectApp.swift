//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by HubertMac on 17/03/2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            FilteringView()
        }
        .modelContainer(for: User.self)
    }
}
