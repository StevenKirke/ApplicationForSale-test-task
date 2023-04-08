//
//  ProfileViewModel.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import Foundation
import SwiftUI


class ProfileViewModel: ObservableObject {
    
    private var workUserDefaults: WorkUserDefaults = WorkUserDefaults()
    private var handlerUM: HandlerUserModel = HandlerUserModel()
    
    @Published var currentUser: UserModel?
        
    func getCurrentUser() {
        guard let userDefault = workUserDefaults.writeUserDefault(model: currentUser) else {
            print("Error userDefault")
            return
        }
        self.currentUser = userDefault
    }
    
    func takeImage(data: Data?) -> Image {
        guard var user = currentUser else {
            return Image(systemName: "")
        }
        if let currentData = data {
            user.data = currentData
            self.workUserDefaults.saveUserDefault(currentUser: user)
        }
        return self.handlerUM.takePhoto(currentUser: user, currentData: data)
    }
    
    func takeFullName() -> String {
        guard let currentUser = currentUser else {
            return "No name"
        }
        var assambly: String = currentUser.firstName
        guard let middle = currentUser.middleName else {
            return assambly
        }
        assambly += " \(middle)"
        assambly += " \(currentUser.lastName)"
        return assambly
    }
    
    func takeBalanse() -> String {
        guard let balance = currentUser?.balance else {
            return "$"
        }
        return "$ \(balance)"
    }
    
    func deleteUser(request: (Bool) -> Void) {
        self.workUserDefaults.removeUserDefault()
        return request(true)
    }

}


