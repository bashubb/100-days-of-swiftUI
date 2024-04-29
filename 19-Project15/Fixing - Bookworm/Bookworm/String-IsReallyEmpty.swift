//
//  String-IsReallyEmpty.swift
//  Bookworm
//
//  Created by HubertMac on 17/03/2024.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
