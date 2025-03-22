//
//  ContentView.swift
//  Project13-Instafilter
//
//  Created by macmini on 3/22/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        ContentUnavailableView("no snippets", systemImage: "swift", description: "you dont have any saved snippets")
        ContentUnavailableView {
            Label("no snippets", systemImage: "swift")
        } description: {
            Text("no snippets yet")
        } actions: {
            Button("create snippet") {
                
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    
}

#Preview {
    ContentView()
}
