//
//  LatestModel.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import Foundation


struct LatestModel: Codable {
    let latest: [Latest]
}

struct Latest: Codable {
    let category, name: String
    let price: Double
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
