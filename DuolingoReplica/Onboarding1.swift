//
//  Onboarding1.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 09/11/25.
//

import UIKit
import SwiftUI
import Lottie

struct Onboarding1: View {
    var next: () -> Void

    var body: some View {
        
        VStack(spacing: 5) {
            Spacer()
            
            // Rounded rectangle we should add alabel inide thats ays "Hi, I'm Duo"
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .frame(width: 182.99, height: 52)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .inset(by: 1)
                        .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
                )
                .overlay(
                    Text("Hi there!, I'm Duo")
                        .font(.custom("DIN_Next Rounded_Bold", size: 17))
                        .foregroundColor(.black)
                        .kerning(0.8)
                )
                .offset(y: 50)
            
            LottieView(animation: .named("duolingo_lottie"))
                .playing(loopMode: .loop)
                .resizable()
                .frame(width: 360, height: 360)
                .padding(.bottom, 10)
            
            Spacer()
            
            // Bottom section with divider and button
            VStack(spacing: 0) {
                // Top border line
                Rectangle()
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(height: 2)
                    .padding(.bottom, 16)
                
                
                // Green button at the bottom
                Button(action: next) {
                    GreenButtonLabel(title: "GET STARTED")
                }
                .buttonStyle(Subtle3DStyle())
                .padding(.horizontal, 16)
                .padding(.bottom, 5)
            }
        }
    }
}

#Preview {
    Onboarding1(next: {})
}
