//
//  ProspectsView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI
import SwiftData

struct ProspectsView: View {
    enum FilterType {
        case none, contacted , uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    
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
            Text("People: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "enzo", emailAddress: "enzo@example.com", isContacted: false)
                        modelContext.insert(prospect)
                    }
                }
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
