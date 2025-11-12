//
//  Onboarding.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 09/11/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var step = 0
    let totalSteps = 5
    @State private var isFinished = false  // Track when onboarding is done

    var body: some View {
        if isFinished {
            // Show LevelsView once onboarding finished
            LevelsView()
        } else {
            VStack(spacing: 0) {
                // Progress bar only for intermediate steps
                Group {
                    if step > 0 && step < totalSteps - 1 {
                        ProgressBarView(currentStep: step, totalSteps: totalSteps) {
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                                step -= 1
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .transition(.move(edge: .top).combined(with: .opacity))
                    } else {
                        Color.clear.frame(height: 0)
                    }
                }
                .animation(.spring(response: 0.45, dampingFraction: 0.8), value: step)

                ZStack {
                    switch step {
                    case 0:
                        Onboarding1 {
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                                step += 1
                            }
                        }
                        .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                removal: .move(edge: .leading)))
                    case 1:
                        Onboarding2(nextAction: {
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                                step += 1
                            }
                        }, backAction: {
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                                step -= 1
                            }
                        }, next: {})
                        .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                removal: .move(edge: .leading)))
                    case 2:
                        Onboarding3 {
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                                step += 1
                            }
                        }
                        .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                removal: .move(edge: .leading)))
                    case 3:
                        Onboarding4 {
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                                step += 1
                            }
                        }
                        .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                removal: .move(edge: .leading)))
                    case 4:
                        Onboarding5 {
                            // Set isFinished to true to switch to LevelsView
                            withAnimation {
                                isFinished = true
                            }
                        }
                    default:
                        EmptyView()
                    }
                }

                Spacer()
            }
        }
    }
}


struct ProgressBarView: View {
    let currentStep: Int
    let totalSteps: Int
    let backAction: () -> Void
    
    // Calculate progress percentage (0.0 to 1.0)
    private var progress: CGFloat {
        CGFloat(currentStep + 1) / CGFloat(totalSteps)
    }
    
    var body: some View {
        HStack(spacing: 15) {
            // Back button
            Button(action: backAction) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(currentStep > 0 ? Color(red: 0.7, green: 0.7, blue: 0.7) : Color.gray.opacity(0.3))
                    .frame(width: 24, height: 24)
                    .padding(4)
            }
            .disabled(currentStep == 0)
            
            // Progress bar background
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background track
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 16)
                        .cornerRadius(8)
                    
                    // Progress fill
                    Rectangle()
                        .fill(Color(red: 1, green: 0.78, blue: 0))
                        .frame(width: geometry.size.width * progress, height: 16)
                        .cornerRadius(8)
                        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: progress)
                }
            }
            .frame(height: 16)
        }
    }
}

// Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
