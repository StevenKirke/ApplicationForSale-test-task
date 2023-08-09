//
//  ColorButton.swift
//  TEST
//
//  Created by Steven Kirke on 24.03.2023.
//

import SwiftUI

struct ColorButton: View {
    
    @Binding var currentColor: Int
    var index: Int
    var color: String
    
    var body: some View {
        Button(action: {
            DispatchQueue.main.async {
                self.currentColor = index
            }
        }) {
            RoundedRectangle(cornerRadius: 9)
                .strokeBorder(Color.gray, lineWidth: color == "#ffffff" ? 2 : 0)
                .background(Color.init(hex: color))
                .frame(width: 36, height: 24)
                .mask(RoundedRectangle(cornerRadius: 9))
                .shadow(color: index == currentColor ? .black : .clear, radius: 1)
        }
    }
}

#if DEBUG
struct ColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorButton(currentColor: .constant(1), index: 0, color: "000000")
    }
}
#endif
