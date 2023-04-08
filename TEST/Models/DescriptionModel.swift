//
//  DescriptionModel.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import Foundation


struct Description: Codable {
    let name, description: String
    let rating: Double
    let numberOfReviews: Int
    let price: Double
    let colors: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case name, description, rating
        case numberOfReviews = "number_of_reviews"
        case price, colors
        case imageUrls = "image_urls"
    }
}

struct ImageDescription: Codable,Identifiable {
    var id = UUID().uuidString
    let image: String
}


