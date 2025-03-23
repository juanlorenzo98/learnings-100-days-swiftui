//
//  ProspectsView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted , uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "everyone"
        case .contacted:
            "contacted people"
        case .uncontacted:
            "uncontacted people"
        }
    }
    var body: some View {
        NavigationStack {
            Text("Hello World!")
                .navigationTitle(title)
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
