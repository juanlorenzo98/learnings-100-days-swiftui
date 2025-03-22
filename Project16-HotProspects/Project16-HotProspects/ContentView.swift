//
//  ContentView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    let users = ["eve", "yuki", "tharz", "ria"]
    @State private var selection = Set<String>()
    
    
    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if selection.isEmpty == false {
            Text("you selected \(selection.formatted())")
        }
        
        EditButton()
    }
}

#Preview {
    ContentView()
}
