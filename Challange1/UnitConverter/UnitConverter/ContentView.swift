//
//  ContentView.swift
//  UnitConverter
//
//  Created by HubertMac on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputValue = 0.0
    @State var inputUnit: Dimension = UnitTemperature.celsius
    @State var outputUnit: Dimension = UnitTemperature.fahrenheit
    @State var choosenConvertion = "Temperature"
    @FocusState var isFocused : Bool
    
    let conversions = ["Temperature", "Lenght", "Time", "Volume"]
    
    let units = [
        [UnitTemperature.celsius,UnitTemperature.fahrenheit,UnitTemperature.kelvin],
        [UnitLength.meters,UnitLength.kilometers,UnitLength.feet, UnitLength.yards, UnitLength.miles],
        [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours],
        [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints,UnitVolume.gallons]
    ]
    let formatter: MeasurementFormatter
    
    
    var unitsForConversion: [Dimension] {
        let unitIndex = conversions.firstIndex(of: choosenConvertion)
        guard let unitIndex = unitIndex else{
            return units[0]
        }
        return units[unitIndex]
    }
    
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
                        ForEach(conversions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section("choose Units") {
                    Picker("Input Unit", selection: $inputUnit){
                        ForEach(unitsForConversion, id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    Picker("Output Unit", selection: $outputUnit){
                        ForEach(unitsForConversion, id: \.self) {
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



