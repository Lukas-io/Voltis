//
//  ProfileCardView.swift
//  Voltis
//
//  Created by lukasio on 02/09/2025.
//

import SwiftUI

struct ProfileCardView: View {
    var model: ProfileModel = .init(
           name: "Josephine",
           imageUrl: "bw",
           location: "100km away",
           occaption: "Student at University of London",
           verified: false,
           getAlongText: "You speak to me nicely and are kind",
           isLike: false
       )
  var body: some View {
      
        VStack(alignment: .trailing, ) {

            Text("New here")
                .padding(.vertical, 4, )
                .padding(.horizontal, 6, )
                .font(.system(size: 10, weight: .medium))
                .background(Color.white)
                .foregroundStyle(.black)
                .cornerRadius(8)
                .padding(.trailing, 22)
                .padding(.top, 22)

            Spacer()

            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(model.name)
                            .font(.system(size: 24, weight: .medium))
                        if model.verified{ Image("badge")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)}

                    }
                    HStack {
                        Image("location")

                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 14)
                        Text(model.location)
                            .font(.system(size: 14, weight: .medium))

                    }

                    HStack {
                        Image("graduate")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 14)
                        Text(model.occaption)
                            .font(.system(size: 14, weight: .medium))

                    }

                }
                Spacer()
                LikeView(isLiked: model.isLike)
            }
            .padding()
            
   
            .background{   LinearGradient(
                gradient: Gradient(colors: [.black.opacity(0.6), .clear]),
                startPoint: .bottom,
                endPoint: .top,
            )
         
            }
             
        

        }
        .background {

            Image(model.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                )
               

        }
        .clipped()
       
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .foregroundStyle(.white)
        
    }
}

#Preview {
    ProfileCardView()
}
