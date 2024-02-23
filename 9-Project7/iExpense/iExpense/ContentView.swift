//
//  ContentView.swift
//  iExpense
//
//  Created by HubertMac on 23/02/2024.
//


import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    @State private var expences = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expences.items) {item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expences.items.append(expense)
                }
            }
        }
    }
    
    func removeItems(at offset: IndexSet) {
        expences.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
