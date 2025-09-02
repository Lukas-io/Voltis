//
//  ProfileView.swift
//  Voltis
//
//  Created by lukasio on 02/09/2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileBrain = ProfileBrain()
    @State private var showConfetti = false

    var body: some View {
        VStack {
            HStack {
                Image("close")
                    .resizable()
                    .frame(width: 16, height: 16)
                Spacer()
                Text("Profile")
                    .font(.system(size: 24, weight: .medium))
                Spacer()
                Image("three_dots_vert")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
            }

            .padding()

            ProfileStackedCards(brain: profileBrain)

            CaptionView(brain: profileBrain)
        }
        .onChange(of: profileBrain.currentIndex) {
            if profileBrain.currentIndex == 3 {
                showConfetti = true
            }
        }
        .fullScreenCover(isPresented: $showConfetti) {
            if profileBrain.currentIndex - 1 < profileBrain.profiles.count
                && profileBrain.currentIndex - 1 >= 0
            {
                ConfettiView(model: profileBrain.profiles[profileBrain.currentIndex - 1])
                    .foregroundStyle(.white)
            }
        }

        .padding()

    }

}

#Preview {
    ProfileView()
}
