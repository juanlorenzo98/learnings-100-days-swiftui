//
//  ContentView.swift
//  Project18-Geometry
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("hello world")
//            .frame(width: 300, height: 300, alignment: .topLeading)
        
//        HStack(alignment: .lastTextBaseline) {
//            Text("live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prospect")
//                .font(.largeTitle)
        
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("number \(position)")
                    .alignmentGuide(.leading) { _ in
                        Double(position) * -10
                    }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
