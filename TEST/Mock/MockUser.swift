//
//  MockUser.swift
//  TEST
//
//  Created by Steven Kirke on 06.04.2023.
//

import Foundation


class UserProfile: ObservableObject {
    @Published var currentUser: UserModel = UserModel(
        firstName: "",
        lastName: "",
        middleName: "Rise",
        email: "",
        password: "111",
        photo: "Icons/Mocks/Profile/PhotoProfile",
        data: nil,
        balance: 1593.00)
}
