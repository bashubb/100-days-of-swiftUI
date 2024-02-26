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
                    if item.type == "Personal"{
                        Section("Personal") {
                            ItemView(item: item)
                        }
                    } else {
                        Section("Business") {
                            ItemView(item: item)
                        }
                    }
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

//challenge3
struct ItemView: View {
    var item: ExpenseItem
    
    //challenge1
    var localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                Text(item.type)
            }
            Spacer()
            
            Text(item.amount, format: .currency(code: localCurrency) )
            //challenge 2
                .foregroundStyle(item.amount < 10 ? .green : item.amount < 100 ? .orange : .red)
        }
    }
}
