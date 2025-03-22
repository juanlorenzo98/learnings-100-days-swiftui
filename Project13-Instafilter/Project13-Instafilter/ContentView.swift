//
//  ContentView.swift
//  Project13-Instafilter
//
//  Created by macmini on 3/22/25.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("learn swift here"), message: Text("check ou the 100 days of swiftUI")) {
            Label("spread the word", systemImage: "swift")
        }
        
//        let example = Image(.example)
        
//        ShareLink(item: example)
        
//        ShareLink(item: example, preview: SharePreview("", image: example)) {
//            Label("click to share", systemImage: "swift")
//        }
        
    }
    
    
}

#Preview {
    ContentView()
}
