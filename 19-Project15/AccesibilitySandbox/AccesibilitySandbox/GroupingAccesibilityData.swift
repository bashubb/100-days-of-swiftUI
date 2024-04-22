//
//  GroupingAccesibilityData.swift
//  AccesibilitySandbox
//
//  Created by HubertMac on 15/04/2024.
//

import SwiftUI

struct GroupingAccesibilityData: View {
    var body: some View {
        /* Image(decorative: "ales-krivec-15949")
         or
        Image(.ales-krivec-15949)
         .accesibilityHidden(true)
         */
        
        VStack {
            Text("Your score is")
            
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        
    }
}

#Preview {
    GroupingAccesibilityData()
}
