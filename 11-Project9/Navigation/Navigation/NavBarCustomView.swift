//
//  NavBarCustomView.swift
//  Navigation
//
//  Created by HubertMac on 29/02/2024.
//

import SwiftUI

//Customizing the navigation bar appearance

struct NavBarCustomView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.yellow.opacity(0.5), for: .navigationBar)
            .toolbarColorScheme(.dark)
            //.toolbar(.hidden)
        }
    }
}

#Preview {
    NavBarCustomView()
}
