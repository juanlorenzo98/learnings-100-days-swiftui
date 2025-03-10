//
//  ContentView.swift
//  Project6-Animation
//
//  Created by macmini on 3/7/25.
//

import SwiftUI

/*
 Challenge:
 1. When you tap a flag, make it spin around 360 degrees on the Y axis.
 2. Make the other two buttons fade out to 25% opacity.
 3. Add a third effect of your choosing to the two flags the user didn’t choose – maybe make them scale down? Or flip in a different direction? Experiment!
 */

struct FlagView: View {
    var flag: String
    var rotateAmount: CGFloat
    var opacityAmount: CGFloat
    var scaleAmount: CGFloat
    
    var body: some View {
        Image(flag)
            .resizable()
            .clipShape(.capsule)
            .padding(20)
            .rotation3DEffect(
                .degrees(rotateAmount),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .opacity(opacityAmount)
            .scaleEffect(scaleAmount)
    }
}

struct ContentView: View {
    
    @State private var asean = ["Brunei", "Cambodia", "Indonesia", "Laos", "Malaysia", "Myanmar", "Philippines", "Singapore", "Thailand", "Vietnam"].shuffled()
    
    @State private var correctAnswer    = Int.random(in: 0...2)
    @State private var showScore        = false
    @State private var scoreTitle       = ""
    @State private var scoreMessage     = ""
    @State private var totalScore       = 0
    @State private var questionCount    = 1
    
    @State private var animationArr             = [false, false, false]
    @State private var rotateAmount: CGFloat    = 0
    @State private var opacityAmount: CGFloat   = 1
    @State private var scaleAmount: CGFloat     = 1
    
    
    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: .orange, location: 0.5),
                    .init(color: .purple, location: 0.5)
                ],
                center: .top,
                startRadius: 200,
                endRadius: 400)
            .ignoresSafeArea()
            
            VStack(spacing: 10) {
                VStack {
                    Text("Question #\(questionCount)")
                    Text("Tap the flag of:")
                    Text("\(asean[correctAnswer])")
                        .foregroundStyle(.primary)
                        .fontWeight(.semibold)
                        .font(.system(size: 36))
                }
                .padding()
                
                Spacer()
                
                ForEach(0..<3) { index in
                    Button {
                        tapped(index)
                        animationArr[index] = true
                        withAnimation(.easeOut(duration: 1)) {
                           rotateAmount = 360
                        }
                        
                        withAnimation(.easeIn(duration: 1)) {
                            scaleAmount     = 0.5
                            opacityAmount   = 0.75
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showScore = true
                        }
                        
                    } label: {
                            FlagView(
                                flag:           asean[index],
                                rotateAmount:   animationArr[index] ? rotateAmount : 0,
                                opacityAmount:  !animationArr[index] ? opacityAmount : 1,
                                scaleAmount:    !animationArr[index] ? scaleAmount : 1
                            )
                    }
                }
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: nextQuestion)
        } message: {
            Text(scoreMessage)
        }
    }
    
    // Functions:
    func tapped(_ number: Int) {
        if questionCount < 8 {
            if number == correctAnswer {
                totalScore += 1
                alertMessage(alertTitle: "Correct", alertMessage: "Your current score is \(totalScore)")
            } else {
                totalScore += 0
                alertMessage(alertTitle: "Wrong", alertMessage: "Your answer is the flag of \(asean[number])")
            }
        } else {
            alertMessage(alertTitle: "Total Score", alertMessage: "Your total score is \(totalScore)")
        }

    }
    
    func alertMessage(alertTitle: String, alertMessage: String) {
        scoreTitle      = alertTitle
        scoreMessage    = alertMessage
    }
    
    func nextQuestion() {
        if questionCount == 8 {
            reset(nthQuestion: questionCount)
        } else {
            reset(nthQuestion: questionCount)
        }
        
    }

    func reset(nthQuestion: Int) {
        
        asean.shuffle()
        correctAnswer   = Int.random(in: 0...2)
        
        animationArr    = [false, false, false]
        rotateAmount    = 0
        opacityAmount   = 1
        scaleAmount     = 1
        
        if nthQuestion == 8 {
            questionCount   = 1
            totalScore      = 0
        } else {
            questionCount   += 1
        }
    }
}

#Preview {
    ContentView()
}
