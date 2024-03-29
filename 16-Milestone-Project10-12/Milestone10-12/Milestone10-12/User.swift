//
//  User.swift
//  Milestone10-12
//
//  Created by HubertMac on 29/03/2024.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    let id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Hubert", age: 35, company: "Hubert Company", email: "hubert.kielkowski@gmail.com", address: "Peace Street", about: "Hubert likes to be iOS dev", registered: .now, tags: ["swift", "swiftui"], friends: [])
}


