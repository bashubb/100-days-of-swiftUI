//
//  ContentView.swift
//  15-SwiftDataChallenges
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftUI

import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Expense]()
    @State private var sortOrder = SortDescriptor(\Expense.name)
    @State private var filterBy = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            ExpensesListingView(sort: sortOrder, filterBy: filterBy)
                .navigationTitle("iExpense")
                .navigationDestination(for: Expense.self) { expense in
                    ExpenseEditView(expense: expense)
                }
                .toolbar {
                    Button("Add Expense", systemImage: "plus", action: addExpense)
                    Menu("Sort", systemImage: "slider.vertical.3") {
                        Text("Sort by")
                            .textCase(.uppercase)
                        Picker("Sort", selection: $sortOrder) {
                            Text("name")
                                .tag(SortDescriptor(\Expense.name))
                            Text("amount")
                                .tag(SortDescriptor(\Expense.amount, order: .reverse))
                        }
                        
                        Text("Show")
                            .textCase(.uppercase)
                        Picker("Filter", selection: $filterBy) {
                            Text("personal")
                                .tag("Personal")
                            Text("business")
                                .tag("Business")
                            Text("all")
                                .tag("")
                        }
                    }
                }
        }
    }
    
    func addExpense() {
        let expense = Expense()
        modelContext.insert(expense)
        path = [expense]
    }
    
}

#Preview {
    ContentView()
}
