//
//  CustomSearchField.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import SwiftUI

struct CustomSearchField: View {
    
    var placeHolder: String
    @Binding var search: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ZStack {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                    if search.isEmpty {
                        Text(placeHolder)
                            .customFont(size: 14, weight: .semibold, color: .g_5B5B5B)
                    }
                    TextField("", text: $search)
                        .customFont(size: 14, weight: .semibold)
                        .multilineTextAlignment(.center)
                }
                HStack(spacing: 0) {
                    Spacer()
                    Button(action: {
                        self.search = ""
                        UIApplication.shared.endEditing()
                        
                    }) {
                        Image(systemName: search.isEmpty ? "magnifyingglass" : "multiply")
                            .iconSize(size: search.isEmpty  ? 18 : 16, color: .g_5B5B5B)
                            .padding(.trailing, 15)
                    }
                }
            }
        }
        .frame(height: 34)
        .background(Color.w_F5F6F7)
        .cornerRadius(15)
    }
}


#if DEBUG
struct CustomSearchField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchField(placeHolder: "What are you looking for ?", search: .constant(""))
    }
}
#endif
