//
//  ContentView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("show tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag("One")
            Button("show tab 1") {
                selectedTab = "One"
            }
            .tabItem {
                Label("Two", systemImage: "circle")
            }
            .tag("Two")
        }
    }
}

#Preview {
    ContentView()
}
