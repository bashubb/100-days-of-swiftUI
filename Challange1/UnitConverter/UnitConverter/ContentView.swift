//
//  ContentView.swift
//  UnitConverter
//
//  Created by HubertMac on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0.0
    @State private var inputUnit: Dimension = UnitTemperature.celsius
    @State private var outputUnit: Dimension = UnitTemperature.fahrenheit
    @State private var choosenConvertion = 0
    @FocusState var isFocused : Bool
    
    let conversions = ["Temperature", "Distance", "Time", "Volume"]
    
    let unitTypes = [
        [UnitTemperature.celsius,UnitTemperature.fahrenheit,UnitTemperature.kelvin],
        [UnitLength.meters,UnitLength.kilometers,UnitLength.feet, UnitLength.yards, UnitLength.miles],
        [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours],
        [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints,UnitVolume.gallons]
    ]
    
    let formatter: MeasurementFormatter
    
    var result: String {
        let inputMeasurement = Measurement(value: inputValue, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        
        return formatter.string(from: outputMeasurement)
    }
    
    var body: some View {
        NavigationStack {
            Form {
              
                Section("choose convertion") {
                    Picker("Choose convertion", selection: $choosenConvertion) {
                        ForEach(0..<conversions.count, id: \.self) {
                            Text(conversions[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section("choose Units") {
                    Picker("Input Unit", selection: $inputUnit){
                        ForEach(unitTypes[choosenConvertion], id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    Picker("Output Unit", selection: $outputUnit){
                        ForEach(unitTypes[choosenConvertion], id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    
                }
                
                
                Section("Input") {
                    TextField("Input Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                
                Section("result") {
                    Text(result)
                }
                
                
                
                
                
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    if isFocused {
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
            }
            .onChange(of: choosenConvertion) {
                let units = unitTypes[choosenConvertion]
                inputUnit = units[0]
                outputUnit = units[1]
            }
        }
    }
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
}

#Preview {
    ContentView()
}



