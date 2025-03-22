//
//  ContentView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            Button("request permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("all set")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("schedule notification") {
                let content = UNMutableNotificationContent()
                content.title = "feed the cat"
                content.subtitle = "it looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }

}

#Preview {
    ContentView()
}
