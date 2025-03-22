//
//  ContentView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var bgColor = Color.red
    
    var body: some View {
        VStack {
            Text("hello world")
                .padding()
                .background(bgColor)
            
            Text("change color")
                .padding()
                .contextMenu {
                    Button("red", systemImage: "checkmark.circle.fill", role: .destructive) {
                        bgColor = .red
                    }
                    Button("blue") {
                        bgColor = .blue
                    }
                    Button("green") {
                        bgColor = .green
                    }
                }
        }
    }

}

#Preview {
    ContentView()
}
