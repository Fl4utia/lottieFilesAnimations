//
//  LevelsView.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 12/11/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct LevelsView: View {
    var body: some View {
        ZStack {
            // Bird animation behind everythin

            VStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color(red: 0.35, green: 0.8, blue: 0.01))
                        .shadow(color: Color(red: 0.35, green: 0.65, blue: 0),
                                radius: 0, x: 0, y: 4)
                        .overlay(
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("SECTION 1 , UNIT 1")
                                        .font(.custom("Feather-Bold", size: 17))
                                        .kerning(0.8)
                                        .scaleEffect(x: 1, y: 1.1)
                                        .foregroundColor(.white)
                                        .opacity(0.7)
                                    
                                    HStack(spacing: 8) {
                                        Text("Form basic sentences")
                                            .font(.custom("Feather-Bold", size: 16))
                                            .kerning(1)
                                            .scaleEffect(x: 1, y: 1.1)
                                            .foregroundColor(.white)
                                    }
                                }
                                
                                Spacer()
                                
                                // Divider line
                                Rectangle()
                                    .fill(.white.opacity(0.4))
                                    .frame(width: 2)
                                    .padding(.trailing, 12)
                                
                                // Notebook icon
                                Image(systemName: "book.closed.fill")
                                    .font(.system(size: 28))
                                    .foregroundColor(.white)
                                    .opacity(0.8)
                            }
                            .padding(.horizontal, 25)
                        )
                }
                .frame(width: 350, height: 100)
                ScrollView{
                    Image("first_level")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.top, 16)
                    
                    // The rest of your levels
                    Image("blocked_level")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                        .padding(.top, 12)
                        .offset(x: 70, y:-20)
                    HStack(spacing: 6){
                        AnimatedImage(name: "levels_bird.gif")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 220)
                            .offset(x: -50, y: -30) // move it to the left
                            .opacity(0.9)
                        Image("book_blocked")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 100)
                            .padding(.top, 12)
                            .offset(x: -30, y: -60)
                    }
                    Image("blocked_treasure")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                        .padding(.top, 16)
                        .offset(x: 30, y: -90)
                    Image("throphy_blocked")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                        .padding(.top, 16)
                        .offset(x: -40, y: -100)
                }
                .scrollIndicators(.hidden)
                .padding(.top, 20)
                Spacer()
                
                Rectangle()
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(height: 2)
                    .padding(.bottom, 16)
                
                HStack {
                    Image("house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                    Image("shield")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                    Image("chest")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                    Image("shop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                }
            }
            .background(Color(UIColor.systemBackground))
        }
    }
}

#Preview {
    LevelsView()
}
