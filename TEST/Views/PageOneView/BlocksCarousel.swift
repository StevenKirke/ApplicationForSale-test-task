//
//  BlocksCarousel.swift
//  TEST
//
//  Created by Steven Kirke on 07.04.2023.
//

import SwiftUI

struct BlocksCarousel: View {
    
    var lates: [Latest] = []
    var sales: [FlashSale] = []
    var brands: [BrandsModel] = []
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 10) {
                HeaderForScroll(title: "Latest", action: {})
                if lates.isEmpty {
                    CarouselEmpty(count: lates.count, width: 120, height: 150)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(lates.indices, id: \.self) { item in
                                CartForLatest(item: lates[item])
                                    .padding(.vertical, 10)
                            }
                        }
                    }
                    .padding(.leading, 6)
                }
            }
            VStack(spacing: 10) {
                HeaderForScroll(title: "Flash Sale", action: {})
                if sales.isEmpty {
                    CarouselEmpty(count: lates.count, width: 184, height: 231)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(sales.indices, id: \.self) { item in
                                CardForSale(item: sales[item])
                                    .padding(.vertical, 10)
                            }
                        }
                        .padding(.leading, 8)
                    }
                }
            }
            VStack(spacing: 10) {
                HeaderForScroll(title: "Brands", action: {})
                if lates.isEmpty {
                    CarouselEmpty(count: lates.count, width: 184, height: 231)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(brands.indices, id: \.self) { item in
                                CardForBrand(item: brands[item])
                                    .padding(.vertical, 10)
                            }
                        }
                        .padding(.leading, 8)
                    }
                }
            }
        }
    }
}

struct BlocksCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
