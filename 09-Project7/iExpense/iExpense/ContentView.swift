//
//  ContentView.swift
//  iExpense
//
//  Created by HubertMac on 23/02/2024.
//


import SwiftUI

struct ExpenseItem: Identifiable, Codable, Equatable {
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
    
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
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
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                //challenge3
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                   showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    //challenge3
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index =  expenses.items.firstIndex(of: item) {
                
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    //challenge3
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at:offsets, in: expenses.personalItems)
    }
    
    //challenge3
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at:offsets, in: expenses.businessItems)
    }
}

#Preview {
    ContentView()
}



