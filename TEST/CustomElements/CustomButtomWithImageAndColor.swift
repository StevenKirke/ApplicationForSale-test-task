//
//  CustomButtomWithImageAndColor.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import SwiftUI

struct CustomButtomWithImageAndColor: View {
    
    var title: String
    var image: Image
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Button(action: action) {
                    Spacer()
                    Text(title)
                        .customFont(size: 18, weight: .bold, color: .g_EAEAEA)
                    Spacer()
                }
                HStack(spacing: 0) {
                    image
                        .iconSize(size: 20, color: .g_EAEAEA)
                        .padding(.leading, 60)
                    Spacer()
                }
            }
        }
        .frame(height: 48)
        .background(Color.b_4E55D7)
        .cornerRadius(15)
    }
}


#if DEBUG
struct CustomButtomWithImageAndColor_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtomWithImageAndColor(title: "Upload item", image: Image.upload, action: {})
    }
}
#endif
