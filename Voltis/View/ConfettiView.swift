//
//  ConfettiView.swift
//  Voltis
//
//  Created by lukasio on 02/09/2025.
//

import SwiftUI

struct ConfettiView: View {
    @Environment(\.dismiss) private var dismiss 
    var model: ProfileModel = .init(
        name: "Josephine",
        imageUrl: "bw",
        location: "100km away",
        occaption: "Student at University of London",
        verified: false,
        getAlongText: "You speak to me nicely and are kind",
        isLike: false,

    )
    var body: some View {
        ZStack {
            // Background
            Image("gradient_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text("Its a match!")
                    .font(.system(size: 50, weight: .bold))

                MatchCardsView(model: model)

                Text("You and \(model.name) have 72 hrs to message each other!")
                    .font(.system(size: 16, weight: .medium))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .padding(.vertical, 24)

                Button{
         
                    dismiss()}
                    label: {
                    HStack {
                        Image("message")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                        Text("Take the first step")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.black)

                    }
                    .frame(width: 260)
                    .padding(.vertical, 16)
                    .background {

                        RoundedRectangle(
                            cornerRadius: 120
                        )

                    }

                }
                .foregroundStyle(.white)
                .padding()
            }

            // Foreground
            Image("confetti")
                .resizable()
                .ignoresSafeArea()
                .allowsHitTesting(false)
        }
    }

}

#Preview {
    ConfettiView()
}
