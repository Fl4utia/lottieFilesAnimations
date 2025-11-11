//
//  Onboarding2.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 09/11/25.
//
import SwiftUI

struct Onboarding2: View {
    var next: () -> Void
    @State private var selectedOption: String? = nil
    
    let options = [
        ("Friends/Family", "media_1"),
        ("Social Media", "media_2"),
        ("TV", "media_3"),
        ("Youtube", "media_4"),
        ("Search Engine", "media_5"),
        ("Tiktok", "media_6")
    ]

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("How did you hear about us?")
                .font(.custom("Feather-Bold", size: 22))
                .foregroundColor(.black)
            
            VStack(spacing: 16) {
                ForEach(options, id: \.0) { option in
                    Button(action: {
                        selectedOption = option.0
                    }) {
                        ZStack {
                            HStack(spacing: 12) {
                                Image(option.1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 36, height: 36)
                                    .padding(4)
                                
                                Text(option.0)
                                    .font(.custom("DINNextRoundedLTW04-Medium", size: 18))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                
                            }
                            .padding(.horizontal, 16)
                        }
                        .frame(width: 345, height: 80)
                        .background(selectedOption == option.0 ? Color(red: 0.87, green: 0.96, blue: 1) : .white)
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
            
            
            // Bottom section with divider and button
            VStack(spacing: 0) {
                // Top border line
                Rectangle()
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(height: 2)
                    .padding(.bottom, 16)
                
                // Green button at the bottom
                Button(action: next) {
                    GreenButtonLabel(title: "Step 2")
                }
                .buttonStyle(Subtle3DStyle())
                .padding(.horizontal, 16)
                .padding(.bottom, 5)
                .disabled(selectedOption == nil)
                .opacity(selectedOption == nil ? 0.5 : 1.0)
            }
        }
    }
}

#Preview {
    Onboarding2(next: {})
}
