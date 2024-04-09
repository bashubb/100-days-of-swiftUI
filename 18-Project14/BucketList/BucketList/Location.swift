//
//  Location.swift
//  BucketList
//
//  Created by HubertMac on 09/04/2024.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
