//
//  ContentView.swift
//  WordScramble
//
//  Created by HubertMac on 14/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    //challenge3
    @State private var scoreForWord = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                
                Section {
                    ForEach(usedWords, id: \.self ) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
            //challenge2
            .toolbar{
                ToolbarItem{
                    Button("Restart") {
                        startGame()
                        usedWords.removeAll()
                    }
                }
                //challenge3
                ToolbarItem(placement: .topBarLeading) {
                    Text("Score for this word : \(scoreForWord)")
                        .foregroundStyle(.red.opacity(0.7))
                        .padding(4)
                        .background(.white, in: .rect(cornerRadius:10))
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        //challenge1
        guard isDifferentThanRootWord(word: answer) else {
            wordError(title: "Word is the same as the RootWord", message: "Try harder!")
            return
        }
        
        //challenge1
        guard isLongEnough(word: answer) else {
            wordError(title: "Word is too short", message: "You need to use few more letters")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        //challenge3
        calculateScore()
        newWord = ""
    }
    
    func startGame() {
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsUrl) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                //challenge3
                scoreForWord = 0
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspeledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspeledRange.location == NSNotFound
    }
    
    // challenge1
    func isDifferentThanRootWord(word: String) -> Bool {
        guard word != rootWord else {
            return false
        }
        return true
    }
    
    //challenge1
    func isLongEnough(word: String) -> Bool {
        guard word.count > 3 else {
            return false
        }
        return true
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError =  true
    }
    
    //challenge3
    func calculateScore() {
        scoreForWord += 10
    }
    
}

#Preview {
    ContentView()
}
