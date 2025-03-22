//
//  ContentView.swift
//  Project13-Instafilter
//
//  Created by macmini on 3/22/25.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        
        Button("leave review") {
            requestReview()
        }

    }
    
    
}

#Preview {
    ContentView()
}
