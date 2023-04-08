//
//  UserModel.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import Foundation


struct UserModel: Codable {
    var firstName: String
    var lastName: String
    var middleName: String?
    var email: String
    var password: String?
    var photo: String?
    var data: Data?
    var balance: Double?
}
