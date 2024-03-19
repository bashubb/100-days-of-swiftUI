//
//  ExpenseEditView.swift
//  15-SwiftDataChallenges
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftData
import SwiftUI

struct ExpenseEditView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var expense: Expense
    
    var hideBackButton: Bool {
        if expense.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || expense.amount == 0 {
            return true
        }
        return false
    }
    
    var localCurrency = Locale.current.currency?.identifier ?? "USD"
    let types = ["Business", "Personal"]
    
    var body: some View {
            Form {
                TextField("Name", text: $expense.name)
                
                Picker("Type", selection: $expense.type){
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $expense.amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Edit Expense")
            .navigationBarBackButtonHidden(hideBackButton)
            .toolbar {
                if hideBackButton {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            modelContext.delete(expense)
                            dismiss()
                        }
                    }
                }
            }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Expense.self, configurations: config)
        let example = Expense(name: "Example Expense")
        return ExpenseEditView(expense: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
