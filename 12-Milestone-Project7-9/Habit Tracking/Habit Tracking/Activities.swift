//
//  Activities.swift
//  Habit Tracking
//
//  Created by HubertMac on 02/03/2024.
//

import Foundation

@Observable
class Activities {
    var activities: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.data(forKey: "Activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: saved) {
                activities = decoded
            }
        }
        
        activities = []
    }
}
