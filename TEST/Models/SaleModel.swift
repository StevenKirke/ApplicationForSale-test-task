//
//  SaleModel.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import Foundation


struct Sale: Codable {
    let flashSale: [FlashSale]

    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct FlashSale: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}
