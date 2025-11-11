//
//  DuoGetStarted.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 06/11/25.
//

import SwiftUI
import AVFoundation
import AVFAudio

struct DuoGetStarted: View {
    @State private var isBlinking = false
    @State private var isWaving = false
    @State private var showMainView = false
    
    var body: some View {
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
            
            // Eyes, Nose and thoung
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
                .scaleEffect(y: isBlinking ? 1 : 0)
                
                // Nose, thoung
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
            
            // Floating logo at bottom
            VStack {
                Spacer()
                
                Image("duolingo_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 120)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 10) // Adjust spacing from bottom
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.2).delay(0.25).repeatCount(2)) {
                isBlinking.toggle()
                
            }
        }
    }
}



class SoundManager {
    static let shared = SoundManager()
    private var player: AVAudioPlayer?

    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("❌ Sound file not found: \(name)")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("❌ Error playing sound: \(error.localizedDescription)")
        }
    }
}

#Preview {
    DuoGetStarted()
        .preferredColorScheme(.light)
}

