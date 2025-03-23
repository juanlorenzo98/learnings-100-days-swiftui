//
//  ContentView.swift
//  Project18-Geometry
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@enzozne")
                    .alignmentGuide(.midAccountAndName) { dimension in
                        dimension[VerticalAlignment.center]
                    }
                Image("penguin")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("full name:")
                Text("JUAN LORENZO")
                    .alignmentGuide(.midAccountAndName) { dimension in
                        dimension[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
