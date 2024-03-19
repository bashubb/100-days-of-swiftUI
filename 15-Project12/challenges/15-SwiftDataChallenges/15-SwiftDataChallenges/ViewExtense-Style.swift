//
//  ViewExtense-Style.swift
//  15-SwiftDataChallenges
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftUI

extension View {
    func style(for item: Expense) -> some View {
        if item.amount < 10 {
            return self.foregroundStyle(.green)
        } else if item.amount < 100 {
            return self.foregroundStyle(.orange)
        } else  {
            return self.foregroundStyle(.red)
        }
    }
}
