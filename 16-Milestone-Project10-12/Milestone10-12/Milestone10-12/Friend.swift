//
//  Friend.swift
//  Milestone10-12
//
//  Created by HubertMac on 29/03/2024.
//

import Foundation

struct Friend: Hashable, Identifiable, Codable {
    let id: UUID
    var name: String
}
