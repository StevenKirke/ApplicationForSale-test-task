//
//  CustomEmptyView.swift
//  TEST
//
//  Created by Steven Kirke on 30.03.2023.
//

import SwiftUI

struct CustomEmptyView: View {
    
    var size: CGSize = CGSize(width: 120, height: 150)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color.g_EEEFF4)
            .frame(width: size.width, height: size.height)
            .shadow(color: Color.g_C4C4C4_85, radius: 2, y: 1)
    }
}

struct CustomEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmptyView()
    }
}
