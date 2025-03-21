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
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("e") &&
        user.city == "qc"
    }, sort: \User.name) var users: [User]
    
    
    var body: some View {
        NavigationStack{
            List(users) { user in
                Text(user.name)
            }
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
            }
        }
    }
}


#Preview {
    ContentView()
}
