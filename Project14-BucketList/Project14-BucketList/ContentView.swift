//
//  ContentView.swift
//  Project14-BucketList
//
//  Created by macmini on 3/23/25.
//

import SwiftUI


struct ContentView: View {

    var body: some View {
        Button("read and write") {
            let data = Data("test message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func test() {
        print(URL.documentsDirectory)
    }
}

#Preview {
    ContentView()
}
