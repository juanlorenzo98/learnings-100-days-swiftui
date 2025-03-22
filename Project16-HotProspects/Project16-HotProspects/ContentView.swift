//
//  ContentView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Image(.chicken)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }

}

#Preview {
    ContentView()
}
