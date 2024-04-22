//
//  ValuesFromControls.swift
//  AccesibilitySandbox
//
//  Created by HubertMac on 15/04/2024.
//

import SwiftUI

struct ValuesFromControls: View {
    @State private var value = 10
    
    var body: some View {
        VStack{
            Text("Value: \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            @unknown default:
                print("Not handled")
            }
        }
    }
}

#Preview {
    ValuesFromControls()
}
