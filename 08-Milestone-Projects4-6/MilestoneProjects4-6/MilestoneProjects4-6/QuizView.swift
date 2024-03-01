//
//  QuizView.swift
//  MilestoneProjects4-6
//
//  Created by HubertMac on 01/03/2024.
//

import SwiftUI

struct QuizView: View {
    var questions: [Question]
    
    @Environment(\.dismiss) var dismiss
    @State private var numberOfQuestion = 0
    @State private var playersAnswer = ""
    @State private var correctAnswers = 0
    @State private var isAlertShowing = false
    
    var currentQuestion: Question {
        questions[numberOfQuestion]
    }
    
    let columns =  [
        GridItem(.flexible(minimum: 60), spacing: 10),
        GridItem(.flexible(minimum: 60), spacing: 10),
        GridItem(.flexible(minimum: 60), spacing: 10)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Question: \(numberOfQuestion) / \(questions.count)")
                    Text("Correct Answers: \(correctAnswers)")
                }
                .padding()
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
            }
            Spacer()
            
            HStack {
                Group {
                    Text(currentQuestion.question)
                    Text(playersAnswer)
                        .foregroundStyle(
                            currentQuestion.answer == playersAnswer ? .green : .red)
                }
                .animation(.bouncy(extraBounce: 0.25), value: playersAnswer)
                .font(.system(size: 50))
                .padding(.vertical)
            }
            
            Spacer()
            
            LazyVGrid(columns: columns){
                ForEach(0..<10) { i in
                    Button {
                            playersAnswer += String(i)
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(height: 80)
                            .overlay (
                                Text("\(i)")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                    }
                }
                Button {
                        removeLast()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.yellow)
                        .overlay(
                            Image(systemName: "arrowshape.left.fill")
                                .font(.title)
                                .foregroundStyle(.white)
                                .shadow(radius: 1.2)
                        )
                }
                Button {
                    checkAnswer()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .overlay(
                            Text("Submit")
                                .font(.title)
                                .foregroundStyle(.white)
                                .shadow(radius: 1.2)
                        )
                }
            }
            
        }
        .fontDesign(.rounded)
        .alert("End of Game", isPresented: $isAlertShowing) {
            Button("Play Again") {
                reset()
            }
            Button("Go to Main") {
                dismiss()
            }
        } message: {
            Text("Your score is \(correctAnswers) correct answers for \(questions.count) questions")
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                } label: {
                    HStack{
                        Image(systemName: "chevron.backward")
                        Text("Go to main")
                    }
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
    
    func nextQuestion() {
        if numberOfQuestion != questions.count - 1 {
            numberOfQuestion += 1
        } else {
            isAlertShowing = true
        }
    }
    
    func checkAnswer() {
        if playersAnswer == currentQuestion.answer {
            correctAnswers += 1
        }
        playersAnswer = ""
        nextQuestion()
    }
    
    func reset() {
        correctAnswers = 0
        numberOfQuestion = 0
    }
    
    func removeLast() {
        var arrayAnswer = Array(playersAnswer)
        if arrayAnswer.count > 1 {
            playersAnswer = String(arrayAnswer.removeLast())
        } else {
            playersAnswer = ""
        }
    }
    
}

#Preview {
    let questions = [Question(question: "2 x 2 = ", answer: "4")]
    return NavigationStack {
        QuizView (questions: questions)
            .preferredColorScheme(.dark)
    }
        
}
