//
//  PreferenceKeys.swift
//  TEST
//
//  Created by Steven Kirke on 24.03.2023.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

