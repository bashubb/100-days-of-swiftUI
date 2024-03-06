//
//  Order.swift
//  CupcakeCorner
//
//  Created by HubertMac on 06/03/2024.
//

import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        willSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false 
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
