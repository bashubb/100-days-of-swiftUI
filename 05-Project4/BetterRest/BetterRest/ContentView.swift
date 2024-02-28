//
//  ContentView.swift
//  BetterRest
//
//  Created by HubertMac on 11/02/2024.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
//    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var sleepResults: (title:String, message:String) {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60 * 60
            
            let prediction =  try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return ("Your ideal sleep time is " , sleepTime.formatted(date: .omitted, time: .shortened))
        } catch {
            return ("","Sorry, there was a problem calculationg your bedtime")
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                //challenge1: Sections
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents:
                            .hourAndMinute)
                    .labelsHidden()
                }
                
                //challenge1: Sections
                Section("Desred amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                //challenge1: Sections
                Section("Daily coffee intake") {
                    
                    //challenge2: Picker
//                    Stepper("^[\(coffeeAmount) cup](inflect:true)", value: $coffeeAmount, in: 1...20)
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach (1..<21) {
                            Text(String($0))
                        }
                    }
                    
                }
                
                //challenge 3
                Section(sleepResults.title) {
                    Text(sleepResults.message)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.red)
                }
                    
                
            }
            .navigationTitle("BetterRest")
            //challenge3
//            .toolbar {
//                Button("Calculate", action: calculateBedTime)
//                
//            }
//            .alert(alertTitle, isPresented: $showingAlert){
//                Button("OK") { }
//            } message: {
//                Text(alertMessage)
//            }
        }
    }
    
    
    //challenge3
//    func calculateBedTime() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//            
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minute = (components.minute ?? 0) * 60 * 60
//            
//            let prediction =  try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
//            
//            let sleepTime = wakeUp - prediction.actualSleep
//            
//            alertTitle = "Your ideal bedtime is..."
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
//        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculationg your bedtime"
//        }
//        showingAlert = true
//    }
}

#Preview {
    ContentView()
}
