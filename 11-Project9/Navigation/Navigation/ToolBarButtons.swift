//
//  ToolBarButtons.swift
//  Navigation
//
//  Created by HubertMac on 29/02/2024.
//

import SwiftUI

struct ToolBarButtons: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {}
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap or Me") {}
                    }
                    
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("Group1") {}
                        Button("Group2") {}
                    }
                }
        }
        
    }
}

#Preview {
    ToolBarButtons()
}
