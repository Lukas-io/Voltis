//
//  ProfileModel.swift
//  Voltis
//
//  Created by lukasio on 02/09/2025.
//
import Foundation

struct ProfileModel: Identifiable {
    let id = UUID()
    let name: String
    let imageUrl: String
    let location: String
    let occaption: String
    let verified: Bool
    let getAlongText: String
    var isLike: Bool
}

class ProfileBrain: ObservableObject {
    @Published var currentIndex: Int = 0
    @Published var profiles: [ProfileModel] = [
        ProfileModel(
            name: "Josephine",
            imageUrl: "bw",
            location: "100km away",
            occaption: "Student at University of London",
            verified: false,
            getAlongText: "You speak to me nicely and are kind",
            isLike: false
        ),
        ProfileModel(
            name: "Amelia",
            imageUrl: "brown",
            location: "80km away",
            occaption: "Designer at Creative Studio",
            verified: true,
            getAlongText: "I love long conversations and coffee dates",
            isLike: false
        ),
        ProfileModel(
            name: "Sophia",
            imageUrl: "bw",
            location: "60km away",
            occaption: "Marketing Specialist",
            verified: false,
            getAlongText: "Be kind, be funny, and we’ll get along",
            isLike: false
        ),
        ProfileModel(
            name: "Olivia",
            imageUrl: "brown",
            location: "45km away",
            occaption: "Doctor at City Hospital",
            verified: true,
            getAlongText: "Honesty is the best way to connect",
            isLike: false
        ),
        ProfileModel(
            name: "Isabella",
            imageUrl: "bw",
            location: "30km away",
            occaption: "Software Engineer",
            verified: false,
            getAlongText: "Talk tech or travel and you’ll have my attention",
            isLike: false
        ),
        ProfileModel(
            name: "Charlotte",
            imageUrl: "brown",
            location: "20km away",
            occaption: "Lawyer at Legal Firm",
            verified: true,
            getAlongText: "Respect and humor are must-haves",
            isLike: false
        ),
        ProfileModel(
            name: "Emily",
            imageUrl: "bw",
            location: "10km away",
            occaption: "Writer and Blogger",
            verified: false,
            getAlongText: "If you love books, we’ll be best friends",
            isLike: false
        ),
        ProfileModel(
            name: "Grace",
            imageUrl: "brown",
            location: "5km away",
            occaption: "Entrepreneur",
            verified: true,
            getAlongText: "Ambition and kindness win my heart",
            isLike: false
        )
    ]
    func swipeCurrent() {
           if currentIndex < profiles.count - 1 {
               currentIndex += 1
           }
       }
}
