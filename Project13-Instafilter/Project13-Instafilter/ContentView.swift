//
//  ContentView.swift
//  Project13-Instafilter
//
//  Created by macmini on 3/22/25.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
//        let inputImage = UIImage(resource: .example)
//        let beginImage = CIImage(cgImage: inputImage)
//        
//        let context = CIContext()
//        let currentFilter = CIFilter.twirlDistortion()
//        
//        let amount = 1.0
//        currentFilter.inputImage = beginImage
//        let inputKeys = currentFilter.inputKeys
//        
//        if inputKeys.contains(kCIInputIntensityKey) {
//            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)}
//        
//        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)}
//        
//        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)}
//        
//        
//        guard let outputImage = currentFilter.outputImage else { return }
//        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
//        
//        let uiImage = UIImage(cgImage: cgImage)
//        image = Image(uiImage: uiImage)
    }
    
    
}

#Preview {
    ContentView()
}
