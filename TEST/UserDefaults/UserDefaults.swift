//
//  UserDefaults.swift
//  TEST
//
//  Created by Steven Kirke on 29.03.2023.
//

import Foundation


class WorkUserDefaults {
    
    func saveUserDefault<T: Encodable>(currentUser: T) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(currentUser) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "user")
        }
    }
    
    func writeUserDefault<T: Decodable>(model: T) -> T? {
        if let userData = UserDefaults.standard.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(T.self, from: userData) {
                return json
            }
        }
        return nil
    }
    
    func removeUserDefault() {
        UserDefaults.standard.removeObject(forKey: "user")
    }

}
