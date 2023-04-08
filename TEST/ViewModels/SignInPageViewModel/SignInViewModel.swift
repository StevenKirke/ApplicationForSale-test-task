//
//  SignInViewModel.swift
//  TEST
//
//  Created by Steven Kirke on 27.03.2023.
//

import Foundation
import SwiftUI


class SignInViewModel: ObservableObject {
    
    private var workUserDefaults: WorkUserDefaults = WorkUserDefaults()
    
    func answerUser(user: UserModel, answer: (Bool, String) -> Void) {
        if user.firstName.isEmpty {
            answer(false, "Empty first name")
        } else if user.lastName.isEmpty {
            answer(false, "Empty last name")
        } else if user.email.isEmpty {
            answer(false, "Empty email")
        } else {
            answer(true, "")
        }
    }
    
    func answerEmail(email: String, model: UserModel, answer: (Bool, String) -> Void) {
        guard let userDefault = workUserDefaults.writeUserDefault(model: model) else {
            answer(false, "User Defaults is Empty")
            return
        }
        if email == userDefault.email {
            answer(true, "This Email exists")
        } else {
            answer(false, "This email is User Defaults")
        }
    }

    func saveUserInUserDefault(currentUser: UserModel) {
        self.workUserDefaults.saveUserDefault(currentUser: currentUser)
    }
}
