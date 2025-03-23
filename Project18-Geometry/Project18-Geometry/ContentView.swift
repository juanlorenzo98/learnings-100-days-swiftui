//
//  ContentView.swift
//  Project18-Geometry
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            GeometryReader { proxy in
                Image("penguin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            
        }
        
            
    }
}

#Preview {
    ContentView()
}
