//
//  ContentView.swift
//  Project13-Instafilter
//
//  Created by macmini on 3/22/25.
//

import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var  processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showFilters = false
    
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
                        ContentUnavailableView("No Picture",
                                systemImage: "photo.badge.plus",
                                description: Text("Tap to import a photo"))
                        
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                    
                }
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    
                    Spacer()
                    
                    
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
            .confirmationDialog("Select a filter", isPresented: $showFilters) {
                Button("Crystallize") {
                    setFilter(CIFilter.crystallize())
                }
                Button("Edges") {
                    setFilter(CIFilter.edges())
                }
                Button("Gaussian Blur") {
                    setFilter(CIFilter.gaussianBlur())
                }
                Button("Pixelate") {
                    setFilter(CIFilter.pixellate())
                }
                Button("Sepia Tone") {
                    setFilter(CIFilter.sepiaTone())
                }
                Button("Unsharp Mask") {
                    setFilter(CIFilter.unsharpMask())
                }
                Button("Vignette") {
                    setFilter(CIFilter.vignette())
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
    
    func changeFilter() {
        showFilters = true
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
        
        
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

#Preview {
    ContentView()
}
