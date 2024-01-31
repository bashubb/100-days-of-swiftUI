//
//  ContentView.swift
//  WeSplit
//
//  Created by HubertMac on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    // Commented because of Challange 3
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalAmount: (perPerson:Double, grandTotal: Double) {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let grandTotal =  checkAmount + (checkAmount * tipSelection / 100)
        
        let totalPerPerson  = grandTotal / peopleCount
        
        return (totalPerPerson, grandTotal)
    }
   
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .focused($amountIsFocused)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section("How much do you want to tip ") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        
                        /* commented because of challange 3
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                         }
                         .pickerStyle(.segmented)
                         */
                        
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                // Challenge 1 - header "Amount per person"
                Section("Amount per person") {
                    Text(totalAmount.perPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
                //Challenge 2 - 4th Section "Grand Total"
                Section("Grand Total") {
                    Text(totalAmount.grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

