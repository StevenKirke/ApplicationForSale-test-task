//
//  CustomTabBar.swift
//  TEST
//
//  Created by Steven Kirke on 18.03.2023.
//

import Foundation



enum CustomTabBar: Int, CaseIterable {
    case pageOne
    case heart
    case pay
    case chat
    case profile
}

extension CustomTabBar {
    var image: String {
        switch self {
        case .pageOne:
            return "Icons/IconForTabBar/HomePDFIcon"
        case .heart:
            return "Icons/IconForTabBar/HeardPDFIcon"
        case .pay:
            return "Icons/IconForTabBar/PayPDFIcon"
        case .chat:
            return "Icons/IconForTabBar/ChatPDFIcon"
        case .profile:
            return "Icons/IconForTabBar/PersonPDFIcon"
        }
    }
}
