//
//  TypeSale.swift
//  TEST
//
//  Created by Steven Kirke on 20.03.2023.
//

import Foundation
import SwiftUI


enum TypeSales: Int, CaseIterable  {
    case phone
    case headphone
    case game
    case car
    case furniture
    case kid
}

extension TypeSales {
    var title: String {
        switch self {
            case .phone:
                return "Phones"
            case .headphone:
                return "Headphones"
            case .game:
                return "Games"
            case .car:
                return "Cars"
            case .furniture:
                return "Furnitures"
            case .kid:
                return "Kids"
        }
    }
    var image: Image {
        switch self {
            case .phone:
                return .phoneIcon
            case .headphone:
                return .headphonesIcon
            case .game:
                return .gamesIcon
            case .car:
                return .carsIcon
            case .furniture:
                return .furnitureIcon
            case .kid:
                return .kidsIcon
        }
    }
}
