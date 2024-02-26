//
//  ExpenseSection.swift
//  iExpense
//
//  Created by HubertMac on 26/02/2024.
//

import SwiftUI

// challenge3
struct ExpenseSection: View {
    var title: String
    var expenses: [ExpenseItem]
    var deleteItems: (IndexSet) -> Void
    
    //challenge1
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
                    //challenge 2
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
