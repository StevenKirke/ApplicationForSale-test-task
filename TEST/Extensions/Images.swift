//
//  Images.swift
//  TEST
//
//  Created by Steven Kirke on 17.03.2023.
//

import SwiftUI


extension Image {
    enum SignIn: String {
        case GooglePDFIcon
        case ApplePDFIcon
    }
    
    enum Profile: String {
        case FolderProfile
        case LogOutProfile
        case HelpProfile
        case ReloadProfile
        case UploadProfile
    }
    
    enum Sale: String {
        case PhoneIcon
        case HeadphonesIcon
        case GamesIcon
        case CarsIcon
        case FurnitureIcon
        case KidsIcon
    }
    
    init(_ name: Image.SignIn) {
        self.init(name.path)
    }
    
    init(_ name: Image.Profile) {
        self.init(name.path)
    }
    
    init(_ name: Image.Sale) {
        self.init(name.path)
    }
}

extension Image.SignIn {
    var path: String {
        "Icons/SignAndLoginView/\(rawValue)"
    }
}

extension Image.Profile {
    var path: String {
        "Icons/IconForProfiles/\(rawValue)"
    }
}

extension Image.Sale {
    var path: String {
        "Icons/IconForSale/\(rawValue)"
    }
}

extension Image {
    static let google = Image(SignIn.GooglePDFIcon)
    static let apple = Image(SignIn.ApplePDFIcon)
    
    static let folder = Image(Profile.FolderProfile)
    static let logOut = Image(Profile.LogOutProfile)
    static let help = Image(Profile.HelpProfile)
    static let reload = Image(Profile.ReloadProfile)
    static let upload = Image(Profile.UploadProfile)
    
    static let phoneIcon = Image(Sale.PhoneIcon)
    static let headphonesIcon = Image(Sale.HeadphonesIcon)
    static let gamesIcon = Image(Sale.GamesIcon)
    static let carsIcon = Image(Sale.CarsIcon)
    static let furnitureIcon = Image(Sale.FurnitureIcon)
    static let kidsIcon = Image(Sale.KidsIcon)
}

extension Image {
    func iconSize(size: CGFloat, color: Color) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}

