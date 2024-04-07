//
//  ContentView.swift
//  InstaFilter
//
//  Created by HubertMac on 30/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                if let processedImage {
                    processedImage
                        processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                }
                
                Spacer()
                
                HStack{
                    Text("Intensity")
                    Slider(value:$filterIntensity)
                }
                
                HStack{
                    Button("Change Filter") {
                        //change filter
                    }
                    
                    Spacer()
                    
                    // share the picture
                }
            }
            .padding([.horizontal, .bottom])
        .navigationTitle("Instafilter")
        }
    }
}

#Preview {
    ContentView()
}
