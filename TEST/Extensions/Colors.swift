//
//  Colors.swift
//  TEST
//
//  Created by Steven Kirke on 17.03.2023.
//


import SwiftUI


extension Color {
    enum Name: String {
        case B_3F3F3F
        case B_4E55D7
        case B_040402
        case B_070604
        case B_161826
        case B_181726
        case B_254FE6
        
        case G_5B5B5B
        case G_7B7B7B
        case G_737373
        case G_808080
        case G_909090
        case G_C0C0C0
        case G_C4C4C4
        case G_E5E9EF
        case G_E8E8E8
        case G_EEEFF4
        case G_5C5C5C
        case G_EAEAEA
        case G_4E4D4D
        case G_B9B9B9
        case G_C4C4C4_85
        case G_EBEBEB
        
        case G_D1D3D9
        
        case R_F93A3A
        
        case Gl_F6C042
        
        case V_99A0FF
        case V_545589
        case V_737297
        
        case W_A6A7AB
        case W_F5F6F7
        case W_FAF9FF
    }
}

extension Color.Name {
    var path: String {
        "CustomColors/\(rawValue)"
    }
}


extension Color {
    init(_ name: Color.Name) {
        self.init(name.path)
    }
    
    static let b_3F3F3F = Color(Name.B_3F3F3F)
    static let b_4E55D7 = Color(Name.B_4E55D7)
    static let b_040402 = Color(Name.B_040402)
    static let b_070604 = Color(Name.B_070604)
    static let b_161826 = Color(Name.B_161826)
    static let b_181726 = Color(Name.B_181726)
    static let b_254FE6 = Color(Name.B_254FE6)
    
    
    static let g_5B5B5B = Color(Name.G_5B5B5B)
    static let g_7B7B7B = Color(Name.G_7B7B7B)
    static let g_737373 = Color(Name.G_737373)
    static let g_808080 = Color(Name.G_808080)
    static let g_909090 = Color(Name.G_909090)
    static let g_C0C0C0 = Color(Name.G_C0C0C0)
    static let g_C4C4C4 = Color(Name.G_C4C4C4)
    static let g_E5E9EF = Color(Name.G_E5E9EF)
    static let g_E8E8E8 = Color(Name.G_E8E8E8)
    static let g_EEEFF4 = Color(Name.G_EEEFF4)
    static let g_5C5C5C = Color(Name.G_5C5C5C)
    static let g_EAEAEA = Color(Name.G_EAEAEA)
    static let g_4E4D4D = Color(Name.G_4E4D4D)
    static let g_B9B9B9 = Color(Name.G_B9B9B9)
    static let g_C4C4C4_85 = Color(Name.G_C4C4C4_85)
    static let g_EBEBEB = Color(Name.G_EBEBEB)
    
    static let g_D1D3D9 = Color(Name.G_D1D3D9)
    
    static let r_F93A3A = Color(Name.R_F93A3A)
    
    static let gl_F6C042 = Color(Name.Gl_F6C042)
    
    static let v_99A0FF = Color(Name.V_99A0FF)
    static let v_545589 = Color(Name.V_545589)
    static let v_737297 = Color(Name.V_737297)
    
    static let w_A6A7AB = Color(Name.W_A6A7AB)
    static let w_F5F6F7 = Color(Name.W_F5F6F7)
    static let w_FAF9FF = Color(Name.W_FAF9FF)
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
