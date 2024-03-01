//
//  AddView.swift
//  Project9_challenge1_2
//
//  Created by HubertMac on 01/03/2024.
//

import SwiftUI

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let expense = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(expense)
                        dismiss()
                    }
                }
                //challenge1
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            //challenge 1
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}

