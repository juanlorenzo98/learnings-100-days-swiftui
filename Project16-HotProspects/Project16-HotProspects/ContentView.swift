//
//  ContentView.swift
//  Project16-HotProspects
//
//  Created by macmini on 3/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        do {
            output = try result.get()
        } catch {
            output = "error \(error.localizedDescription)"
        }
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}
