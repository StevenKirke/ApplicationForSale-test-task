//
//  MenuForProfile.swift
//  TEST
//
//  Created by Steven Kirke on 18.03.2023.
//

import Foundation
import SwiftUI


enum MenuForProfile: Int, CaseIterable {
    case tradeStore
    case payment
    case balance
    case tradeHistory
    case restore
    case help
    case logOut
}

extension MenuForProfile {
    var title: String {
        switch self {
            case .tradeStore:
                return "Trade store"
            case .payment:
                return "Payment method"
            case .balance:
                return "Balance"
            case .tradeHistory:
                return "Trade history"
            case .restore:
                return "Restore Purchase"
            case .help:
                return "Help"
            case .logOut:
                return "Log out"
        }
    }
    var image: Image {
        switch self {
            case .tradeStore:
                return .folder
            case .payment:
                return .folder
            case .balance:
                return .folder
            case .tradeHistory:
                return .folder
            case .restore:
                return .reload
            case .help:
                return .help
            case .logOut:
                return .logOut
        }
    }
}

