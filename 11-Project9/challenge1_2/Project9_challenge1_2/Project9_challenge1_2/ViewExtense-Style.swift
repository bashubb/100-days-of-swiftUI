//
//  ViewExtense-Style.swift
//  Project9_challenge1_2
//
//  Created by HubertMac on 01/03/2024.
//

import Foundation

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
