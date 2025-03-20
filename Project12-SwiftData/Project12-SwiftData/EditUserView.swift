//
//  EditUserView.swift
//  Project12-SwiftData
//
//  Created by macmini on 3/21/25.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        Form {
            TextField("name", text: $user.name)
            TextField("city", text: $user.city)
            DatePicker("join date", selection: $user.joinDate)
        }
        .navigationTitle("edit user")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "enzo", city: "new york", joinDate: .now)
        
        return EditUserView(user: user)
            .modelContainer(container)
    } catch {
        return Text("blah blah \(error.localizedDescription)")
    }
    
}
