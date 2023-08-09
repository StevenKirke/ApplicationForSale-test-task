//
//  CustomButtonWithImage.swift
//  TEST
//
//  Created by Steven Kirke on 17.03.2023.
//

import SwiftUI

struct CustomButtonWithImage: View {
    
    let title: String
    let image: Image
    let action: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: action) {
                HStack(alignment: .center, spacing: 12) {
                    image
                        .iconSize(size: 26, color: .black)
                    Text(title)
                        .customFont(size: 14, weight: .light, color: .black)
                }
            }
        }
        .frame(height: 22)
    }
}


#if DEBUG
struct CustomButtonWithImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonWithImage(title: "Sign in with Google", image: Image.google, action: {})
    }
}
#endif
