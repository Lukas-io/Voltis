//
//  MatchCardsView.swift
//  Voltis
//
//  Created by lukasio on 02/09/2025.
//

import SwiftUI

struct MatchCardsView: View {
    var model: ProfileModel = ProfileModel(
        name: "Isabella",
        imageUrl: "bw",
        location: "30km away",
        occaption: "Software Engineer",
        verified: false,
        getAlongText: "Talk tech or travel and you’ll have my attention",
        isLike: false
    )

    @State private var liked = false
    @State private var animate = false

    var body: some View {

        ZStack {

            Image("me")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                .scaleEffect(animate ? 1.2 : 0.5)  // scale
                .rotationEffect(.degrees(animate ? 10 : 0))  // rotate
                .offset(x: animate ? 50 : 0, y: animate ? 120 : 0)  // move up
                .opacity(animate ? 1 : 0)  // fade

            Image(model.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                .scaleEffect(animate ? 1.1 : 0.5)
                .rotationEffect(.degrees(animate ? -12 : 0))
                .offset(x: animate ? -80 : 0, y: animate ? -70 : 0)
                .opacity(animate ? 1 : 0)
            Image(liked ? "like_on" : "like_off")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .scaleEffect(liked ? 1.2 : 1.0)
                .padding()

        }
        .padding(.top, 110)
        .padding(.bottom, 140)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    animate = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    liked = true
                }
            }
        }
    }
}

#Preview {
    MatchCardsView()
}
