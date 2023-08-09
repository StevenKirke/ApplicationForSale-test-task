//
//  CustomTextFieldEmail.swift
//  TEST
//
//  Created by Steven Kirke on 28.03.2023.
//

import SwiftUI

struct CustomTextFieldEmail: View {
    
    var workToString: WorkToNumber = WorkToNumber()
    
    var placeHolder: String
    @Binding var title: String
    @Binding var emailValid: String
    @Binding var isValid: Bool
    
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
                    .onChange(of: title) {
                        if self.workToString.textFieldValidatorEmail($0) {
                            self.isValid = true
                            self.emailValid = ""
                        } else {
                            self.isValid = false
                            self.emailValid = "No correct email"
                        }
                    }
            }
        }
        .frame(height: 34)
        .background(Color.g_E8E8E8)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red ,lineWidth: emailValid.isEmpty ? 0 : 1)
        )
    }
}


#if DEBUG
struct CustomTextFieldEmail_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldEmail(placeHolder: "Email", title: .constant(""), emailValid: .constant(""), isValid: .constant(false))
    }
}
#endif

