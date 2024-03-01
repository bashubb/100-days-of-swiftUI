//
//  ExpenseSection.swift
//  Project9_challenge1_2
//
//  Created by HubertMac on 01/03/2024.
//

import SwiftUI


import SwiftUI

struct ExpenseSection: View {
    var title: String
    var expenses: [ExpenseItem]
    var deleteItems: (IndexSet) -> Void
    
    var localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        
                        Text(item.type)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: localCurrency) )
                        .style(for: item)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseSection(title: "Section", expenses: [], deleteItems: { _ in })
}

