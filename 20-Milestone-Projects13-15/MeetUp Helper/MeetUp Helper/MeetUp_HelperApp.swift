//
//  MeetUp_HelperApp.swift
//  MeetUp Helper
//
//  Created by HubertMac on 07/05/2024.
//

import SwiftData
import SwiftUI

@main
struct MeetUp_HelperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                
        }
        .modelContainer(for: FriendModel.self)
    }
}
