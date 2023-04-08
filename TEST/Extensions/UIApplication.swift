//
//  UIApplication.swift
//  TEST
//
//  Created by Steven Kirke on 17.03.2023.
//


import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
