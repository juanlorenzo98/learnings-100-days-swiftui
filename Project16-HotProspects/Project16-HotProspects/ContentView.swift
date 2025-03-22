//
//  ContentView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        List {
            Text("swift")
                .swipeActions {
                    Button("delete", systemImage: "minus.circle", role: .destructive) {
                        print("delete")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("pinning")
                    }
                    .tint(.orange)
                }
        }
    }

}

#Preview {
    ContentView()
}
