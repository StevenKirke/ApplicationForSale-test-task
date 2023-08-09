//
//  CustomButton.swift
//  TEST
//
//  Created by Steven Kirke on 17.03.2023.
//

import SwiftUI

struct CustomButton: View {
    
    var title: String
    var color: Color
    var action: () -> Void
    
    
    var body: some View {
        HStack() {
            Button(action: action) {
                Spacer()
                Text(title)
                    .customFont(size: 14, weight: .bold, color: color)
                Spacer()
            }        }
        .frame(height: 52)
        .background(Color.b_4E55D7)
        .cornerRadius(15)
    }
}


#if DEBUG
struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Sign in", color: .g_EAEAEA, action: {})
    }
}
#endif
