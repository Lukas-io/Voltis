//
//  LikeView.swift
//  Voltis
//
//  Created by lukasio on 02/09/2025.
//

import SwiftUI

struct LikeView: View {
    var size: CGFloat = 50
    @State var isLiked: Bool = false

    var body: some View {
        Button {
            withAnimation(.spring()) {
                isLiked.toggle()
            }
        } label: {
            Image(isLiked ? "like_on" : "like_off")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size)
                .scaleEffect(isLiked ? 1.1 : 1.0)
                .padding()
        }
    }
}

#Preview {
    LikeView() 
}
