//
//  HeaderForScroll.swift
//  TEST
//
//  Created by Steven Kirke on 20.03.2023.
//

import SwiftUI

struct HeaderForScroll: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text(title)
                .customFont(size: 14, weight: .semibold, color: .b_040402)
            Spacer()
            Button(action: action) {
                Text("View all")
                    .customFont(size: 12, weight: .light, color: .g_808080)
                    .offset(y: -6)
            }
        }
    }
}

#if DEBUG
struct HeaderForScroll_Previews: PreviewProvider {
    static var previews: some View {
        HeaderForScroll(title: "Test", action: {})
    }
}
#endif
