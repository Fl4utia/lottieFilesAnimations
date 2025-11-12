//
//  Untitled.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 12/11/25.
//

import SwiftUI
import DotLottie

struct Onboarding5: View {
    let finish: () -> Void
    var body: some View {
        VStack(spacing: 5) {
            
            Spacer()
            ZStack {
                Spacer()
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .frame(width: 192.99, height: 90)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 1)
                            .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
                    )
                    .overlay(
                        Text("Well done, let's start learning!")
                            .font(.custom("DIN_Next Rounded_Bold", size: 17))
                            .foregroundColor(.black)
                            .padding(10)
                            .kerning(0.8)
                            .lineSpacing(8)
                    )
                
                
            }
            DotLottieAnimation(
                webURL: "https://lottie.host/5e2fe969-2b55-4f81-a1c8-72d62f7fc191/00Z5iHS1iN.json",
                config: AnimationConfig(autoplay: true, loop: true)
            )
            .view()
            .frame(width: 300, height: 300)
            .onAppear {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.prepare()
                
                // Rapid-fire pattern: 4 quick hits
                for i in 0..<4 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + (0.08 * Double(i))) {
                        generator.impactOccurred(intensity: 0.9)
                    }
                }
            }
            Spacer()
            // Bottom section with divider and button
            VStack(spacing: 0) {
                // Top border line
                Rectangle()
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(height: 2)
                    .padding(.bottom, 16)
                
                
                // Green button at the bottom
                Button(action: {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                    
                    finish()
                }) {
                    GreenButtonLabel(title: "Start learning")
                }
                .buttonStyle(Subtle3DStyle())
                .padding(.horizontal, 16)
                .padding(.bottom, 5)
            }
        }
    }
}

#Preview {
    Onboarding5(finish: {})
}
