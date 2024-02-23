//
//  ContentView.swift
//  iExpense
//
//  Created by HubertMac on 23/02/2024.
//


import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = [ExpenseItem]()
    }
}

struct ContentView: View {
    @State private var expences = Expenses()
    
    @State private var showingAddExpense = false
    
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
                   showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expences)
        }
    }
    
    func removeItems(at offset: IndexSet) {
        expences.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
