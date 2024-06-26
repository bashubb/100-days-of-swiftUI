//
//  EditCards.swift
//  Flashzilla
//
//  Created by HubertMac on 21/06/2024.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = DataManager.load()
    @State private var newPrompt =  ""
    @State private var newAnswer = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment:.leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                            
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("EditCards")
            .toolbar{
                Button("Done", action: done)
            }
            
        }
    }
    
    func done() {
        dismiss()
    }
    
    func addCard(){
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedAnswer.isEmpty == false && trimmedPrompt.isEmpty == false else { return }
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        DataManager.save(cards)
        
        // Challenge 1
        newPrompt = ""
        newAnswer = ""
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        DataManager.save(cards)
    }
}

#Preview {
    EditCards()
}
