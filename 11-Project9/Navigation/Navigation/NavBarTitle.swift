//
//  NavBarTitle.swift
//  Navigation
//
//  Created by HubertMac on 29/02/2024.
//

import SwiftUI

struct NavBarTitle: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello World")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavBarTitle()
}
