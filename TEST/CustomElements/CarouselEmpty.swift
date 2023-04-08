//
//  CarouselEmpty.swift
//  TEST
//
//  Created by Steven Kirke on 07.04.2023.
//

import SwiftUI

struct CarouselEmpty: View {
    
    var count: Int
    var width: CGFloat
    var height: CGFloat

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
             HStack(spacing: 10) {
                 if count == 0 {
                     ForEach(0...4, id: \.self) { item in
                         SkeletonLoader(width, height)
                     }
                 }
           }
       }
    }
}

struct CarouselEmpty_Previews: PreviewProvider {
    static var previews: some View {
        CarouselEmpty(count: 3, width: 300, height: 200)
    }
}
