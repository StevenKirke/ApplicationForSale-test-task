//
//  CustomTextFields.swift
//  TEST
//
//  Created by Steven Kirke on 17.03.2023.
//

import SwiftUI

struct CustomTextFields: View {
    
    var placeHolder: String
    @Binding var title: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                if title.isEmpty {
                    Text(placeHolder)
                        .customFont(size: 14, weight: .semibold, color: .g_7B7B7B)
                }
                TextField("", text: $title)
                    .customFont(size: 14, weight: .semibold)
                    .multilineTextAlignment(.center)

            }
        }
        .frame(height: 34)
        .background(Color.g_E8E8E8)
        .cornerRadius(15)
    }
}


#if DEBUG
struct CustomTextFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFields(placeHolder: "First name", title: .constant(""))
    }
}
#endif


