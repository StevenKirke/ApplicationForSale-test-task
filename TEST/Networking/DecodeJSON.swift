//
//  DecodeJSON.swift
//  TEST
//
//  Created by Steven Kirke on 20.03.2023.
//

import Foundation


class DecodeJson {
    
    func JSONDecode<T: Decodable>(data: Data, model: T, returnJSON: @escaping (T?, String?) -> Void)  {
        DispatchQueue.main.async {
            do {
                let decodedUsers = try JSONDecoder().decode(T.self, from: data)
                return returnJSON(decodedUsers, "")
            } catch let error {
                print("error JSON --- \(error)")
                return returnJSON(nil, "Error decode JSON \(error)")
            }
        }
    }
}
