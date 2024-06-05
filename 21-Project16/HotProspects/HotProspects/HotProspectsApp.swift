//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by HubertMac on 04/06/2024.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
