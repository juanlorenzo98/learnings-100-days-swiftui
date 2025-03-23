//
//  ContentView.swift
//  Project18-Geometry
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { number in
                    GeometryReader { g in
                        Text("number \(number)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-g.frame(in: .global).minX / 8), axis: (x: 0, y: 1, z: 0)
                            )
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

//struct ContentView: View {
//    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
//    
//    var body: some View {
//        GeometryReader { fullView in
//            
//            
//            ScrollView {
//                ForEach(0..<50) { index in
//                    GeometryReader { g in
//                        Text("row #\(index)")
//                            .font(.title)
//                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
//                            .rotation3DEffect(
//                                .degrees(
//                                    (g.frame(in: .global).minY - (fullView.size.height)/2)
//                                    )/5,
//                                axis: (x: 0.0, y: 1.0, z: 0.0)
//                            )
//                    }
//                    .frame(height: 40)
//                }
//            }
//        }
//    }
//}

#Preview {
    ContentView()
}
