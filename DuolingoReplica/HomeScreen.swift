//
//  HomeScreen.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 07/11/25.
//
import SwiftUI
import Lottie

struct HomeScreen: View {
    @State private var startOnboarding = false

    var body: some View {
        NavigationStack {
            VStack {
                // Top logo
                Image("logo_green")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 80)
                    .padding(.top, 10)

                Spacer(minLength: 90)

                // Characters
                Image("characters")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 420, height: 420)
                    .offset(y: -50)

                // Subtitle text
                Text("Learn a language for free. Forever.")
                    .offset(y: -70)
                    .multilineTextAlignment(.center)
                    .font(.custom("DINNextRoundedLTW04-Regular", size: 17))

                Spacer(minLength: 60)
                
                // Buttons at the bottom
                VStack(spacing: 16) {
                    // Green button
                    Button {
                        startOnboarding = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color(red: 0.35, green: 0.8, blue: 0.01))
                                .shadow(color: Color(red: 0.35, green: 0.65, blue: 0), radius: 0, x: 0, y: 4)
                                .overlay(
                                    Text("GET STARTED")
                                        .font(.custom("Feather-Bold", size: 15))
                                        .kerning(0.5)
                                        .scaleEffect(x: 1, y: 1.1)
                                        .foregroundColor(.white)
                                )
                        }
                        .frame(width: 330, height: 46)
                    }
                    .buttonStyle(Subtle3DStyle())

                    // White button
                    Button {
                        startOnboarding = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
                                )
                            Text("I ALREADY HAVE AN ACCOUNT")
                                .font(.custom("Feather-Bold", size: 15))
                                .kerning(0.5)
                                .scaleEffect(x: 1, y: 1.1)
                                .foregroundColor(Color(red: 0.11, green: 0.69, blue: 0.96))
                        }
                        .frame(width: 330, height: 48)
                    }
                    .buttonStyle(Subtle3DStyle())
                }
                .padding(.bottom, 40)
            }
            // Navigation
            .navigationDestination(isPresented: $startOnboarding) {
                OnboardingView()
            }
        }
    }
}



struct Subtle3DStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.clear)
                    .shadow(
                        color: Color(red: 0.35, green: 0.65, blue: 0),
                        radius: 0,
                        x: 0,
                        y: configuration.isPressed ? 1 : 4
                    )
            )
            .offset(y: configuration.isPressed ? 1 : 0) // gentle press-in
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

struct GreenButtonLabel: View {
    var title: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(red: 0.35, green: 0.8, blue: 0.01))
                .shadow(color: Color(red: 0.35, green: 0.65, blue: 0),
                        radius: 0, x: 0, y: 4)
                .overlay(
                    Text(title.uppercased())
                        .font(.custom("Feather-Bold", size: 15))
                        .kerning(0.5)
                        .scaleEffect(x: 1, y: 1.1)
                        .foregroundColor(.white)
                )
        }
        .frame(width: 330, height: 46)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
