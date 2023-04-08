//
//  CircleButton.swift
//  TEST
//
//  Created by Steven Kirke on 20.03.2023.
//

import SwiftUI

struct CircleButton: View {
    
    var image: Image = Image(systemName: "plus")
    var size: CGFloat = 35
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            image
                .iconSize(size: (size / 2), color: .v_545589)
        }
        .background(
            Circle()
                .fill(Color.g_E5E9EF)
                .frame(width: size,height: size)
        )
    }
}

#if DEBUG
struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(action: {})
    }
}
#endif
