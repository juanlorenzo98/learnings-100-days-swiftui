//
//  ContentView.swift
//  Project5-Word-Scramble
//
//  Created by macmini on 3/7/25.
//

import SwiftUI

/*
 Challenge:
 1. Disallow answers that are shorter than three letters or are just our start word.
 2.Add a toolbar button that calls startGame(), so users can restart with a new word whenever they want to.
 3. Put a text view somewhere so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.
 */


struct ContentView: View {
    // Properties
    @State private var usedWords    = [String]()
    @State private var rootWord     = ""
    @State private var newWord      = ""
    
    @State private var errorTitle   = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    // Challenge 3
    @State private var score = 0
    
        
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    Text("Score: \(score)")
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }

            }
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            // Challenge 2
            .toolbar(content: {
                Button("Start Game", action: startGame)
            })
            // Challenge 2
            .onSubmit(addNewWord)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") {}
            } message: {
                Text(errorMessage)
            }
        }
    }
    // Functions:
    func startGame() {
        if let startFile = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startFile) {
                let words = startWords.components(separatedBy: "\n")
                rootWord = words.randomElement() ?? "none"
                usedWords.removeAll() // Challenge 2 - Remove Words
                score = 0 // Challenge 3 - Reset Score
                return
            }
        }
    }
    
    func addNewWord() {
        let input = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Challenge 1
//        guard input.count > 0 else {
//            return
//        }
        guard challenge1(word: input) else {
            wordError(title: "OOPS!", message: "Must be longer than 3 letters or not \(rootWord) itself")
            return
        }
        // Challenge 1
        
        guard isOriginal(word: input) else {
            wordError(title: "The word is already used", message: "Use other words")
            return
        }
        
        guard isPossible(word: input) else {
            wordError(title: "The word isn't possible", message: "Can't spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: input) else {
            wordError(title: "The word isn't recognized", message: "Can't make the words up")
            return
        }
        
        challenge3Score(word: input)
        
        withAnimation {
            usedWords.insert(input, at: 0)
        }
        
        newWord = ""
    }
    
    // Challenge 3
    func challenge3Score(word: String) {
        var score = word.count
        self.score += score
    }
    // Challenge 3
    
    // Validators:
    
    // Challenge 1
    func challenge1(word: String) -> Bool {
        if word.count > 3 && word != rootWord {
            return true
        } else {
            return false
        }
    }
    // Challenge 1
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var temp = rootWord
        
        for letter in word {
            if let position = temp.firstIndex(of: letter) {
                temp.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker         = UITextChecker()
        let range           = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange  = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return mispelledRange.location == NSNotFound
    }
    
    // Alert Message:
    func wordError(title: String, message: String) {
        errorTitle      = title
        errorMessage    = message
        showingError    = true
    }
}

#Preview {
    ContentView()
}
