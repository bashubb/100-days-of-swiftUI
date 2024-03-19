//
//  ExpenseSection.swift
//  15-SwiftDataChallenges
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftData
import SwiftUI


struct ExpensesListingView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Expense.name) var expenses: [Expense]
    
    var localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        List {
            ForEach(expenses) { expense in
                NavigationLink(value: expense) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            
                            Text(expense.type)
                        }
                        Spacer()
                        
                        Text(expense.amount, format: .currency(code: localCurrency) )
                        //challenge 2
                            .style(for: expense)
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
    
    func deleteItems(_ indexSet: IndexSet) {
        for index in indexSet {
            let expense = expenses[index]
            modelContext.delete(expense)
        }
    }
    
    init(sort: SortDescriptor<Expense>, filterBy: String){
        _expenses = Query(filter: #Predicate {
            if filterBy.isEmpty == false {
                return $0.type == filterBy
            } else {
                return true
            }
        } ,sort: [sort])
    }
}

#Preview {
    ExpensesListingView(sort: SortDescriptor(\Expense.name), filterBy: "")
}
