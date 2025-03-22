//
//  ContentView.swift
//  Project14-BucketList
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "arnold", lastName: "swarks"),
        User(firstName: "dima", lastName: "kisis"),
        User(firstName: "david", lastName: "bim")
    ].sorted()
    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

#Preview {
    ContentView()
}
