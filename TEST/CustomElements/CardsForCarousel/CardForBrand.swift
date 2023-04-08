//
//  CardForBrand.swift
//  TEST
//
//  Created by Steven Kirke on 21.03.2023.
//

import SwiftUI

struct CardForBrand: View {
    
    var item: BrandsModel
    
    var urlImage: String {
        return "https://applen1.ru/" + item.picture
    }
    
    var body: some View {
        NavigationLink(destination: PageTwoView()) {
            ZStack {
                GeometryReader { proxy in
                    ZStack(alignment: .center) {
                        Color.clear.background(Color.white)
                            .cornerRadius(11)
                            .shadow(radius: 4)
                        CustomImage(image: urlImage)
                            .scaledToFill()
                         .frame(width: 184, height: 231)
                            .mask(
                                RoundedRectangle(cornerRadius: 9)
                                    .frame(width: proxy.size.width, height: proxy.size.height)
                            )
                    }
                }
                ZStack(alignment: .bottom) {
                    VStack(spacing: 0) {
                        Spacer()
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.name)
                                    .customFont(size: 10, weight: .semibold, color: .black)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal,10)
                                    .background(Color.g_C4C4C4)
                                    .cornerRadius(10)
                                HStack(spacing: 0) {
                                    Text("")
                                        .customFont(size: 12, weight: .bold, color: .black)
                                        .lineLimit(3)
                                    Spacer()
                                        .frame(width: 50)
                                }
                                Text("")
                                    .customFont(size: 12, weight: .bold, color: .black)
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                }
            }
            .frame(width: 184, height: 231)
        }
    }
}


#if DEBUG
struct CardForBrand_Previews: PreviewProvider {
    static var previews: some View {
        CardForBrand(item: branchMock)

    }
}
#endif

var branchMock: BrandsModel =  BrandsModel(id: ID.integer(324),
                                           name: "IPad",
                                           picture: "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg")
