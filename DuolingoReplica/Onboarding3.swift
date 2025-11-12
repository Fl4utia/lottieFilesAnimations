//
//  Onboarding3.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 09/11/25.
//

import SwiftUI
import Lottie

struct Onboarding4: View {
    var next: () -> Void
    @State private var selectedOption: String? = nil
    
    let options = [
        ("5 min / day", "Casual"),
        ("10 min / day", "Regual"),
        ("15 min / day", "Serious"),
        ("20 min / day", "Intense"),
    ]

    //Command option -> para foldear el codigo
    var body: some View {
        VStack(spacing: 0) {
            // Scrollable content area
                VStack(spacing: 20) {

                    HStack{
                        LottieView(animation: .named("bird_duo_writes"))
                            .playing(loopMode: .loop)
                            .resizable()
                            .animationSpeed(1.5)
                            .frame(width: 130, height: 130)
                        ZStack {
                            SpeechBubble()
                                .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)

                            Text("What is your daily learning goal?")
                                .padding(10)
                                .font(.custom("DIN_Next Rounded_Bold", size: 17))
                                .foregroundColor(.black)
                                .kerning(0.8)
                                .lineSpacing(8)
                        }
                        .frame(width: 200, height: 100)
                        
                    }
                    ScrollView {
                    VStack(spacing: 16) {
                        ForEach(options, id: \.0) { option in
                            Button(action: {
                                selectedOption = option.0
                            }) {
                                HStack {
                                    Text(option.0)
                                        .font(.custom("DINNextRoundedLTW04-Medium", size: 18))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Text(option.1)
                                        .font(.custom("DINNextRoundedLTW04-Regular", size: 18))
                                        .foregroundColor(.black)
                                    
                        
                                }
                                .padding(.horizontal, 16)
                                .frame(width: 345, height: 80)
                                .background(selectedOption == option.0 ? Color(red: 0.87, green: 0.96, blue: 1) : (Color(UIColor.systemBackground)))
                                .cornerRadius(12)
                                .shadow(color: selectedOption == option.0 ? Color(red: 0.52, green: 0.85, blue: 1) : Color(red: 0.9, green: 0.9, blue: 0.9), radius: 0, x: 0, y: 2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .inset(by: 1)
                                        .stroke(selectedOption == option.0 ? Color(red: 0.52, green: 0.85, blue: 1) : Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
                                )
                            }
                        }
                    }

                    
                    Spacer()
                        .frame(minHeight: 30)
                }
                    .padding(.top, 50)
                    .scrollIndicators(.hidden)

                    
                .frame(maxWidth: .infinity)
            }
                .padding(.top, 5)
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(height: 2)
                    .padding(.bottom, 16)
                
                Button(action: {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                    
                    next()
                }) {
                    GreenButtonLabel(title: "Continue")
                }
                .buttonStyle(Subtle3DStyle())
                .padding(.horizontal, 16)
                .padding(.bottom, 5)
            }
            .background(Color(UIColor.systemBackground))
        }
        .padding(.top, 5)
    }
}

#Preview {
    Onboarding4(next: {})
}
