//
//  ContentView.swift
//  InstaFilter
//
//  Created by HubertMac on 30/03/2024.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
                
                
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
    
    func changeFilter() {
        
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage  = UIImage(data: imageData) else { return }
            
            // more code to come
        }
    }
}

#Preview {
    ContentView()
}
