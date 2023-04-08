//
//  CustomPasswordFields.swift
//  TEST
//
//  Created by Steven Kirke on 18.03.2023.
//

import SwiftUI

struct CustomPasswordFields: View {
    
    var placeHolder: String
    @State var isShow: Bool = false
    @Binding var title: String
    
    
    var body: some View {
        
        HStack(spacing: 0) {
            ZStack {
                ZStack {
                    if title.isEmpty {
                        Text(placeHolder)
                            .customFont(size: 14, weight: .semibold, color: .g_7B7B7B)
                    }
                    if !isShow {
                        SecureField("", text: $title)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 14, weight: .semibold))
                    } else {
                        Text(title)
                            .customFont(size: 14, weight: .semibold, color: .g_7B7B7B)
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        self.isShow.toggle()
                    }) {
                        Image(systemName: isShow ? "eye" : "eye.slash")
                            .foregroundColor(.g_5C5C5C)
                    }
                }
                .padding(.trailing, 12)
            }
        }
        .frame(height: 34)
        .background(Color.g_E8E8E8)
        .cornerRadius(15)
    }
}


#if DEBUG
struct CustomPasswordFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomPasswordFields(placeHolder: "Password", title: .constant(""))
    }
}
#endif
