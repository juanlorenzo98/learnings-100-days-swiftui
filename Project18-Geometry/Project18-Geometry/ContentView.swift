//
//  ContentView.swift
//  Project18-Geometry
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("TOP")
            
            InnerView()
                .background(.green)
            
            Text("BOTTOM")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("LEFT")
            
            GeometryReader { geometry in
                Text("CENTER")
                    .background(.blue)
                    .onTapGesture {
                        print("GLOBAL CENTER IS \(geometry.frame(in: .global).midX) x \(geometry.frame(in: .global).midY)")
                        
                        print("CUSTOM CENTER IS \(geometry.frame(in: .named("Custom")).midX) x \(geometry.frame(in: .named("Custom")).midY)")
                        
                        print("LOCAL CENTER IS \(geometry.frame(in: .local).midX) x \(geometry.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            
            Text("RIGHT")
        }
    }
}

struct ContentView: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    ContentView()
}
