//
//  ContentView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("everyone", systemImage: "person.3")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("me", systemImage: "person.crop.square")
                }
        }
    }

}

#Preview {
    ContentView()
}
