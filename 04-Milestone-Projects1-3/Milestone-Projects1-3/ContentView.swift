//
//  ContentView.swift
//  Milestone-Projects1-3
//
//  Created by HubertMac on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊", "🫲", "✌️"]
    
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = true
    
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingResults = Bool.random()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.gray, Color.white, Color.gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Computer has played...")
                    .font(.headline)
                
                Text(moves[computerChoice])
                    .font(.system(size:200))
                
                if shouldWin {
                    Text("Which one wins?")
                        .foregroundStyle(.green)
                        .font(.title)
                        .shadow(radius: 0.2, x: 1, y:1)
                } else {
                    Text("Wich one loses?")
                        .foregroundStyle(.red)
                        .font(.title)
                        .shadow(radius: 0.2, x: 1, y:1)
                }
                
                HStack {
                    ForEach(0..<3) {number in
                        Button(moves[number]) {
                            play(choice: number)
                        }
                        .font(.system(size: 80))
                    }
                }
                .padding()
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
                .shadow(radius: 1)
                .padding(.top, 20)
                
                
                Spacer()
                
                Text("Score: \(score)")
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                
                Spacer()
            }
            .alert("Game over", isPresented: $showingResults) {
                Button("Play again", action: reset)
            } message: {
                Text("Your score was \(score)")
            }
        }
    }
    
    func play(choice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningMoves[computerChoice]
        } else {
            didWin = winningMoves[choice] == computerChoice
        }
        
        if didWin {
            score += 1
        } else {
            score -= 1
        }
        
        if questionCount == 10 {
            showingResults = true
        } else {
            computerChoice = Int.random(in: 0..<3)
            shouldWin = Bool.random()
            questionCount += 1
        }
    }
    
    func reset() {
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        questionCount = 1
        score = 0
    }
}

#Preview {
    ContentView()
}
