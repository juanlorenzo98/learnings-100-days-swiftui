//
//  ContentView.swift
//  Project12-SwiftData
//
//  Created by macmini on 3/21/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    
    @State private var sortOder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
        NavigationStack{
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOder)
            .navigationTitle("users")
            .toolbar {
                Button("add samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "enzo", city: "qc", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "imba", city: "manila", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "super", city: "pasig", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "easy", city: "pasay", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                
                Button(showingUpcomingOnly ? "show everyone" : "show upcoming") {
                    showingUpcomingOnly.toggle()
                }
                Menu("sort", systemImage: "arrow.up.arrow.down") {
                    Picker("sort", selection: $sortOder) {
                        Text("sort by name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        Text("sort by date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
                
            }
        }
    }
}


#Preview {
    ContentView()
}
