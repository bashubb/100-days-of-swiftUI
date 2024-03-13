//
//  BookwormApp.swift
//  Bookworm
//
//  Created by HubertMac on 10/03/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
