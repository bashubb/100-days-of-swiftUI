//
//  ViewExtense-Style.swift
//  iExpense
//
//  Created by HubertMac on 26/02/2024.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.foregroundStyle(.green)
        } else if item.amount < 100 {
            return self.foregroundStyle(.orange)
        } else  {
            return self.foregroundStyle(.red)
        }
    }
}
