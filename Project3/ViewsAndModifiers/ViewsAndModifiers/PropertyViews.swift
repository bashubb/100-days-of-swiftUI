//
//  PropertyViews.swift
//  ViewsAndModifiers
//
//  Created by HubertMac on 30/01/2024.
//

import SwiftUI

struct PropertyViews: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
        
    let motto2 = Text("nunquam titillandus")
    
    // first option: Stack
    // second option: Group
    // third option: @ViewBuilder

    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
        
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
            
            spells
                .font(.title2)
                .foregroundColor(.green)
        }
    }
}

#Preview {
    PropertyViews()
}
