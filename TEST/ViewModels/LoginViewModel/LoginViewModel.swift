//
//  LoginViewModel.swift
//  TEST
//
//  Created by Steven Kirke on 29.03.2023.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    private var workUserDefaults: WorkUserDefaults = WorkUserDefaults()
    
   var currentUser: UserModel?
    
    @Published var firstName: String = ""
    @Published var password: String = ""
    
    init() {
        self.firstName = ""
        self.password = ""
    }
    
    func getCurrentUser() {
        guard let userDefault = workUserDefaults.writeUserDefault(model: currentUser) else {
            return
        }
        self.currentUser = userDefault
    }
    
    func answerUser(response: (Bool, String) -> Void) {
        guard let currentUser = currentUser else {
            return response(false, "User Defaults is Empty")
        }
        if self.firstName == currentUser.firstName && self.password == currentUser.password {
            return response(true, "")
        } else if self.firstName != currentUser.firstName {
            return response(false, "No correct First name")
        } else if  self.password != currentUser.password {
            return response(false, "No correct password")
        }
    }
    
    
}
