//
//  ContentView.swift
//  Project13-Instafilter
//
//  Created by macmini on 3/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showConfirmation = false
    @State private var bgColor = Color.white
    var body: some View {
        Button("hello world") {
            showConfirmation.toggle()
        }
        .frame(width: 300, height: 300)
        .background(bgColor)
        .confirmationDialog("change background", isPresented: $showConfirmation) {
            Button("red") {
                bgColor = .red
            }
            Button("green") {
                bgColor = .green
            }
            Button("blue") {
                bgColor = .blue
            }
            Button("cancel", role: .cancel) {
               
            }
        } message: {
            Text("select a new color")
        }
    }
}

#Preview {
    ContentView()
}
