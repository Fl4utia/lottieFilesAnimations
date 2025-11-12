//
//  test.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 11/11/25.
//
import SwiftUI

struct TestView: View {
    @State private var scale = 0.5


    var body: some View {
        VStack {
            Circle()
                .scaleEffect(y: scale)
                .animation(.easeIn(duration: 2), value: scale)
            Circle()
                .scale(scale)
                .animation(.easeOut(duration: 2), value: scale)
            HStack {
                Button("+") { scale += 0.1 }
                Button("-") { scale -= 0.1 }
            }
        }
    }
}

#Preview {
    TestView()
}
