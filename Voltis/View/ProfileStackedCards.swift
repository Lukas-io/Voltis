//
//  ProfileStackedCards.swift
//  Voltis
//
//  Created by lukasio on 02/09/2025.
//

import SwiftUI

struct ProfileStackedCards: View {
    @ObservedObject var brain = ProfileBrain()
    @State private var offset: CGSize = .zero  // 👈 don’t forget this

    var body: some View {
        ZStack {
            ForEach(brain.profiles.indices, id: \.self) { index in
                let profile = brain.profiles[index]

                ProfileCardView(model: profile)
                    .overlay(
                        ZStack {
                            Color.black
                                .cornerRadius(12)
                                .opacity(
                                    index == brain.profiles.count - 1
                                        ? min(
                                            Double(abs(offset.width) / 280),
                                            0.2
                                        )
                                        : 0
                                )
                            if abs(offset.width) > 80 && index == brain.profiles.count - 1{
                                Image(
                                    offset.width > 0
                                        ? "like_fade" : "reject_fade"
                                )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                
                            }

                        }
                    )
                    .offset(
                        index == brain.profiles.count - 1
                            ? offset : .zero
                    )
                    .rotationEffect(
                        index == brain.profiles.count - 1
                            ? .degrees(Double(offset.width / 20)) : .zero
                    )
                    .scaleEffect(
                        index == brain.profiles.count - 1 ? 1.0 : 0.95
                    )
                    .gesture(
                        index == brain.profiles.count - 1
                            ? DragGesture()
                                .onChanged { gesture in
                                    offset = gesture.translation
                                
                                }
                                .onEnded { _ in
                                    if abs(offset.width) > 80 {
                                        // swipe away top card
                                        withAnimation {
                                            brain.profiles.removeLast()
                                            brain.swipeCurrent()
                                            offset = .zero
                                        }
                                    } else {
                                        // snap back
                                        withAnimation {
                                            offset = .zero
                                        }
                                    }
                                }
                            : nil
                    )

                    .animation(.spring(), value: offset)
            }
        }
    }
}

#Preview {
    ProfileStackedCards()
}
