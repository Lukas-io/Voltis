//
//  CaptionView.swift
//  Voltis
//
//  Created by lukasio on 02/09/2025.
//

import SwiftUI
struct CaptionView: View {
    @ObservedObject var brain: ProfileBrain

    var body: some View {
        VStack(alignment: .leading) {
            Text("We'll get along if...")
                .font(.system(size: 14, weight: .medium))
     
            Text(
                brain.currentIndex < brain.profiles.count ?
                "\"\(brain.profiles[brain.currentIndex].getAlongText)\""
                : "\"No profile available\""
            )
                .font(.system(size: 20, weight: .medium))
                .padding(.top, 4)
                .id(brain.currentIndex)                 // key by index
                .contentTransition(.opacity)            // fade
                .animation(.easeInOut, value: brain.currentIndex)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("BrandBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.top, 8)
        .foregroundStyle(.white)
    }
}

