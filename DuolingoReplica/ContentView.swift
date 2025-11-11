//
//  ContentView.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 05/11/25.
//
import SwiftUI
import AVFoundation
import AVFAudio

struct ContentView: View {
    @State private var isBlinking = false
    @State private var showMainView = false
    @State private var circleScale: CGFloat = 0
    @State var isHomeRootScreen = false
    @State private var playSound = false
    
    var body: some View {
        ZStack {
            HomeScreen()
            
            if !isHomeRootScreen {
                ZStack {
                    Color(red: 0.35, green: 0.8, blue: 0.01)
                        .ignoresSafeArea()
                    
                    // Face
                    VStack {
                        Image("face")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 280)
                            .zIndex(0)
                            .offset(y: -32)
                    }
                    
                    // Eyes, Nose and tongue
                    VStack(spacing: -12) {
                        
                        // Eyes
                        HStack(spacing: 22) {
                            ZStack { // Left eye
                                Image("eyelid")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                Image("pipul")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Color.white.opacity(0.3)
                                    )
                            }
                            
                            ZStack { // Right eye
                                Image("eyelid")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                Image("pipul")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Color.white.opacity(0.3)
                                    )
                            }
                        }
                        .scaleEffect(y: isBlinking ? 1 : 0.1)
                    
                                   .onAppear {
                                   }
                        // Nose, tongue
                        VStack(spacing: -32) {
                            Image("nose")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .zIndex(1)
                            Image("thoung")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 40)
                        }
                        .offset(y: -24)
                        .padding(.bottom)
                    }
                    
                    VStack {
                        Spacer()
                        
                        Image("duolingo_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170, height: 120)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.bottom, 10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    
                    // Circle mask overlay for transition
                    Circle()
                        .fill(Color.white)
                        .scaleEffect(circleScale)
                        .ignoresSafeArea()
                }
                    .mask(
                        Rectangle()
                            .ignoresSafeArea()
                            .overlay(
                                Circle()
                                    .scaleEffect(circleScale)
                                    .blendMode(.destinationOut)
                                    .ignoresSafeArea()
                            )
                    )
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.2).delay(0.25).repeatCount(2)) {
                            isBlinking.toggle()
                            
                        }
                    // Second: Circle expansion after blink completes
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            circleScale = 3.0 // Scale large enough to cover screen
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        SoundManager.shared.playSound(named: "duolingoLaunchSound")
                    }
                    // Finally: Switch to home screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                        isHomeRootScreen = true
                        
                    }

                }
            }
        }
    }
}
#Preview {
    ContentView()
}
