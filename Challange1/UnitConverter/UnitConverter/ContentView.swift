//
//  ContentView.swift
//  UnitConverter
//
//  Created by HubertMac on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputValue = 0.0
    @State var inputUnit = "Celcius"
    @State var outputUnit = "Celcius"
    @State var choosenConvertion = "Temperature"
    @FocusState var isFocused : Bool
    
    let conversions = ["Temperature", "Lenght", "Time", "Volume"]
    
    let temperatureUnits = [
        "Celcius" : UnitTemperature.celsius,
        "Farenheit" : UnitTemperature.fahrenheit,
        "Kelvin" : UnitTemperature.kelvin]
    
    let lenghtUnits = [
        "Meters" : UnitLength.meters,
        "Kilometers" : UnitLength.kilometers,
        "Feet" : UnitLength.feet,
        "Yards" : UnitLength.yards,
        "Miles" : UnitLength.miles]
    
    let timeUnits = [
        "Seconds" : UnitDuration.seconds,
        "Minutes" : UnitDuration.minutes,
        "Hours" : UnitDuration.hours]
    
    let volumeUnits = [
        "Mililiters" : UnitVolume.milliliters,
        "Liters" : UnitVolume.liters,
        "Cups" : UnitVolume.cups,
        "Pints" : UnitVolume.pints,
        "Gallons" : UnitVolume.gallons]
    
    
    var unitsForConversion: [String:Dimension] {
        if choosenConvertion == "Temperature" {
            return temperatureUnits
        } else if choosenConvertion == "Lenght" {
            return lenghtUnits
        } else if choosenConvertion == "Time" {
            return timeUnits
        } else if choosenConvertion == "Volume" {
            return volumeUnits
        }
        return temperatureUnits
    }
    
    var outputValue: String? {
        let input = Measurement(value: inputValue, unit: unitsForConversion[inputUnit] ?? UnitTemperature.celsius)
        let output = input.converted(to: unitsForConversion[outputUnit] ?? UnitTemperature.celsius).formatted()
        
        return "\(output)"
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
                        ForEach(Array(unitsForConversion.keys), id: \.self) { name in
                            Text(name)
                        }
                    }
                    Picker("Output Unit", selection: $outputUnit){
                        ForEach(Array(unitsForConversion.keys), id: \.self) { name in
                            Text(name)
                        }
                    }
                    
                }
                
                Section("Input") {
                    TextField("Input Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                
                Section("Result") {
                    Text(outputValue ?? "")
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
}

#Preview {
    ContentView()
}



