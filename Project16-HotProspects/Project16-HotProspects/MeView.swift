//
//  MeView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
    @AppStorage("name") private var name = "anonymous"
    @AppStorage("email") private var email = "me@mesite.com"
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("email", text: $email)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        let image = generateQRCode(from: "\(name)\n\(email)")
                        ShareLink(item: Image(uiImage: image), preview: SharePreview("My QR Code", image: Image(uiImage: image)))
                    }
            }
            .navigationTitle("your code")
            .onAppear(perform: updateCOde)
            .onChange(of: name, updateCOde)
            .onChange(of: email, updateCOde)
        }
    }
    
    func updateCOde() {
        qrCode = generateQRCode(from: "\(name)\n\(email)")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
                
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MeView()
}
