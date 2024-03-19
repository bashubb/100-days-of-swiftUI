//
//  Expense.swift
//  15-SwiftDataChallenges
//
//  Created by HubertMac on 19/03/2024.
//

import Foundation
import SwiftData

@Model
class Expense {
    
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    
    init(id: UUID = UUID(), name: String = "", type: String = "Personal", amount: Double = 0) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
