//
//  ContentView.swift
//  Project13-Instafilter
//
//  Created by macmini on 3/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0 {
        didSet {
            print("new value is \(blurAmount)")
        }
    }
    var body: some View {
        VStack {
            Text("hello world")
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...20)
            Button("random blue") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    ContentView()
}
