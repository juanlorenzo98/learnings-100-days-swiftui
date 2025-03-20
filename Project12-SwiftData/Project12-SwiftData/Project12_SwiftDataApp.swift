//
//  Project12_SwiftDataApp.swift
//  Project12-SwiftData
//
//  Created by macmini on 3/21/25.
//

import SwiftUI
import SwiftData

@main
struct Project12_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
