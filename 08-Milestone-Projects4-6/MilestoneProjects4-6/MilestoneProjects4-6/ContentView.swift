//
//  ContentView.swift
//  MilestoneProjects4-6
//
//  Created by HubertMac on 22/02/2024.
//

import SwiftUI

struct Question {
    var question: String
    var answer: String
}

struct ContentView: View {
    @State private var multiplicationNumber = 2
    @State private var numberOfQuestions = 5
    
    @State private var questions = [Question]()
    
    let questionsOptions = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            Form {
                Stepper("Tables for \(multiplicationNumber)", value: $multiplicationNumber, in: 2...12)
                Section("Number of Questions") {
                    Picker("Number of Questions", selection: $numberOfQuestions) {
                        ForEach(questionsOptions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Button{
                    generateQuestions()
                } label: {
                    Text("Generate questions")
                        .foregroundStyle(.white)

                }
                .listRowBackground(!questions.isEmpty ? Color.gray.opacity(0.7) : Color.blue)
                .disabled(!questions.isEmpty)
                
                NavigationLink("Start ", destination: QuizView(questions: questions))
                    .buttonStyle(.borderedProminent)
                    .listRowBackground(questions.isEmpty ? Color.gray.opacity(0.7) : Color.green)
                    .disabled(questions.isEmpty)
            
            }
            .onAppear{
                questions.removeAll()
            }
            .navigationTitle("Multiplication")
            .toolbar {
                Button("Reset") {
                    questions.removeAll()
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func generateQuestions() {
        questions.removeAll()
        for _ in 0..<numberOfQuestions {
            let number = Int.random(in: 1..<13)
            let question = Question(question: "\(multiplicationNumber) x \(number) = ", answer: "\(multiplicationNumber * number)")
            questions.append(question)
            
        }
    }
    
}

#Preview {
    ContentView()
}


