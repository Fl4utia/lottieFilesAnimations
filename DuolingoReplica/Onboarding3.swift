//
//  Onboarding3.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 09/11/25.
//

import SwiftUI

struct Onboarding3: View {
    var finish: () -> Void

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Image("bird")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)

            Text("You're all set!")
                .font(.custom("Feather-Bold", size: 24))
                .foregroundColor(.white)
            
            Text("Let’s start learning your first words.")
                .font(.custom("Feather-Regular", size: 16))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Spacer()

            Button(action: finish) {
                GreenButtonLabel(title: "START LEARNING")
            }
            .buttonStyle(Subtle3DStyle())

            Spacer()
        }
        .padding()
    }
}
