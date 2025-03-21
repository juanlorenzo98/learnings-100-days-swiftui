//
//  UsersView.swift
//  Project12-SwiftData
//
//  Created by macmini on 3/21/25.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
                Text(user.name)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
