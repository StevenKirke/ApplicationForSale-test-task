//
//  Text.swift
//  TEST
//
//  Created by Steven Kirke on 17.03.2023.
//


import SwiftUI


extension Text {
    func customFont(size: CGFloat, weight: Font.Weight, color: Color) -> some View {
        self
            .font(Font.custom("NotoNastaliqUrdu", size: size))
            .fontWeight(weight)
            .foregroundColor(color)
            .fontDesign(.default)
    }
}


extension TextField {
    func customFont(size: CGFloat, weight: Font.Weight) -> some View {
        self
            .font(Font.custom("NotoNastaliqUrdu", size: size))
            .fontWeight(weight)
            .foregroundColor(.g_7B7B7B)
            .tint(.black)
            .fontDesign(.default)
    }
}
