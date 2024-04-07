//
//  ContentView.swift
//  InstaFilter
//
//  Created by HubertMac on 30/03/2024.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var uiImage: UIImage?
    
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 3.0
    @State private var filterScale = 5.0
    
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilters = false
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    @State private var currentFilter: CIFilter =  CIFilter.sepiaTone()
    let context = CIContext()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                VStack {
                    // challenge 2
                    if currentFilter.inputKeys.contains(kCIInputIntensityKey) {
                        HStack{
                            Text("Intensity")
                            Slider(value:$filterIntensity)
                                .onChange(of: filterIntensity, applyProcessing)
                        }
                        // challenge 1
                        .disabled(selectedItem == nil)
                    }
                    
                    if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
                        HStack{
                            Text("Radius")
                            Slider(value:$filterRadius, in: 0...200)
                                .onChange(of: filterRadius, applyProcessing)
                        }
                        // challenge 1
                        .disabled(selectedItem == nil)
                    }
                    
                    if currentFilter.inputKeys.contains(kCIInputScaleKey) {
                        HStack{
                            Text("Scale")
                            Slider(value:$filterScale, in: 0...10)
                                .onChange(of: filterScale, applyProcessing)
                        }
                        // challenge 1
                        .disabled(selectedItem == nil)
                    }
                }
                .padding(.vertical)
                
                HStack{
                    Button("Change Filter") {changeFilter()}
                        // challenge 1
                        .disabled(selectedItem == nil)
                    Spacer()
                    
                    if let processedImage {
                       
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter", image: processedImage))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Bloom") { setFilter(CIFilter.bloom())}
                Button("Crystalize") { setFilter(CIFilter.crystallize())}
                Button("Edges") { setFilter(CIFilter.edges())}
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur())}
                Button("Noir") { setFilter(CIFilter.photoEffectNoir())}
                Button("Pixellate") { setFilter(CIFilter.pixellate())}
                Button("Pointillize") { setFilter(CIFilter.pointillize())}
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone())}
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask())}
                Button("Vignette") { setFilter(CIFilter.vignette())}
                Button("Cancel", role: .cancel) { }
            }
            
        }
    }
    
    func changeFilter() {
        showingFilters = true
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage  = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)}
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale, forKey: kCIInputScaleKey)}
         
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        uiImage = UIImage(cgImage: cgImage)
        if let uiImage = uiImage {
            processedImage = Image(uiImage: uiImage)
        }
    }
    
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        
        if filterCount >= 20  {
            requestReview()
            filterCount = 0
        }
    }
    
}

#Preview {
    ContentView()
}
