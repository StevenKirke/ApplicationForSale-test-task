//
//  CardForBrand.swift
//  TEST
//
//  Created by Steven Kirke on 21.03.2023.
//

import SwiftUI

struct CardForBrand: View {
    
    var item: BrandsModel
    
    var body: some View {
            GeometryReader { proxy in
                ZStack(alignment: .bottomLeading) {
                    CustomImage(image: item.picture)
                        .scaledToFit()
                    Text(item.name)
                        .customFont(size: 10, weight: .semibold, color: .black)
                        .frame(maxWidth: 100, maxHeight: 28, alignment: .topLeading)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(Color.g_C4C4C4)
                        .cornerRadius(8)
                        .padding(.leading, 10)
                        .padding(.bottom, 10)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black.opacity(0.2), lineWidth: 2)
                        .frame(width: 184, height: 184)
                )
            }
            .frame(width: 184, height: 194)
    }
}


#if DEBUG
struct CardForBrand_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                CardForBrand(item: branchMockFirst)
                CardForBrand(item: branchMockSecond)
                CardForBrand(item: branchMockThird)
            }
        }
        
    }
}
#endif

var branchMockFirst: BrandsModel =  BrandsModel(id: ID.integer(324),
                                                name: "eS Accel Og Shoes",
                                                picture: "https://shop.ccs.com/cdn/shop/products/194691417367-1_1280x.jpg?v=1682980222")
var branchMockSecond: BrandsModel =  BrandsModel(id: ID.integer(324),
                                                 name: "Adidas Sam Pro Model Adv Shoes",
                                                 picture: "https://shop.ccs.com/cdn/shop/products/195744115735-1_1280x.jpg?v=1683238474")
var branchMockThird: BrandsModel =  BrandsModel(id: ID.integer(324),
                                                name: "Nike SB Zoom Nyjah 3 Shoes",
                                                picture: "https://shop.ccs.com/cdn/shop/files/196969131234-1_1280x.jpg?v=1690568184")
