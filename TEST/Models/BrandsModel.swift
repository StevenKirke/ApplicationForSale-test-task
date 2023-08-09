//
//  BrandsModel.swift
//  TEST
//
//  Created by Steven Kirke on 21.03.2023.
//

import Foundation


struct BrandsModel: Codable {
    let id: ID
    let name, picture: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case picture = "pictures"
    }
}

enum ID: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ID.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
