//
//  String-isEmptyChecking.swift
//  CupcakeCorner
//
//  Created by HubertMac on 10/03/2024.
//

import Foundation

//challenge1
extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
