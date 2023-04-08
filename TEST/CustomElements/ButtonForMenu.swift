//
//  ButtonForMenu.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import SwiftUI

struct ButtonForMenu<Content: View>: View {
    
    var itenMenu: MenuForProfile
    var content: Content
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 20) {
                itenMenu.image
                    .iconSize(size: 22, color: .b_040402)
                    .background(
                        Circle()
                            .fill(Color.g_EEEFF4)
                            .frame(width: 40, height: 40)
                    )
                Text(itenMenu.title)
                    .customFont(size: 20, weight: .regular, color: .b_040402)
                Spacer()
                content
            }
        }
        .frame(height: 48)
    }
}


#if DEBUG
struct ButtonForMenu_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForMenu(itenMenu: .logOut, content: Text(""), action: {})
    }
}
#endif
