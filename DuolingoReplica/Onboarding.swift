//
//  Onboarding.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 09/11/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var step = 0

    var body: some View {
        ZStack {
            switch step {
            case 0:
                Onboarding1 { step += 1 }
                    .transition(.asymmetric(insertion: .move(edge: .trailing),
                                            removal: .move(edge: .leading)))
            case 1:
                Onboarding2 { step += 1 }
                    .transition(.asymmetric(insertion: .move(edge: .trailing),
                                            removal: .move(edge: .leading)))
            case 2:
                Onboarding3 {
                    print("Go to main app")
                }
                    .transition(.asymmetric(insertion: .move(edge: .trailing),
                                            removal: .move(edge: .leading)))
            default:
                EmptyView()
            }
        }
        .animation(.spring(response: 0.45, dampingFraction: 0.8), value: step)
    }
}
