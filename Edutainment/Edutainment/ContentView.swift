//
//  ContentView.swift
//  Edutainment
//
//  Created by macmini on 3/11/25.
//

import SwiftUI

enum game {
    case intro
    case before
    case during
    case after
}

struct ContentView: View {
    @State private var state = game.intro
    
    private let color1 = #colorLiteral(red: 0.2784460485, green: 0.9129009247, blue: 0.8982922435, alpha: 1)
    private let color2 = #colorLiteral(red: 0.7211218476, green: 0.06838209927, blue: 0.8362898231, alpha: 1)
    private let colorAnimation = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    @State private var animationAmount: CGFloat = 1
    
    @State private var multiple = 2
    @State private var numberOfRounds = 5
    @State private var roundPickerAmounts = [5, 10, 20]
    
    @State private var isFormAnimated = false
    @State private var formAnimationAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            BackgroundView(color1: color1, color2: color2)
            
            VStack {
                if state == .intro {
                    Button("Start Game") {
                        state = .before
                    }
                    .padding()
                    .foregroundStyle(.black)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .clipShape(.capsule)
                    .overlay {
                        Capsule()
                            .stroke(Color(colorAnimation), lineWidth: 1)
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                            .animation(
                                .easeOut(duration: 1)
                                .repeatForever(autoreverses: false),
                                value: animationAmount
                            )
                    }
                    .onAppear {
                        animationAmount = 2
                    }
                } else if state == .before {
                    VStack {
                        
                        Form {
                            Section {
                                Stepper("Multiple of: \(multiple)", value: $multiple, in: 2...12, step: 1)
                            }
                            
                            Section {
                                Text("Number of Rounds")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                Picker("", selection: $numberOfRounds) {
                                    ForEach(roundPickerAmounts, id: \.self) {
                                        Text("\($0)")
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                            }
                            
                            Section {
                                Button(action: {
                                    isFormAnimated = true

                                    withAnimation(.easeIn(duration: 0.5)) {
                                        formAnimationAmount = 0
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        startGame()
                                    }
                                }, label: {
                                    Text("START")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                })
                            }
                        }
                    }
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .scaleEffect(isFormAnimated ? formAnimationAmount : 1)
                    .opacity(isFormAnimated ? formAnimationAmount : 1)
                       
                } else if state == .during {
                    
                }
                
            }
        }
    }
    
    func startGame() {
        state = .during
    }
}

struct BackgroundView: View {
    var color1: UIColor
    var color2: UIColor
    
    var body: some View {
        LinearGradient(
            colors: [Color(color1), Color(color2)],
            startPoint: .top,
            endPoint: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
