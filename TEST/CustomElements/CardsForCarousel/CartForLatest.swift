//
//  CartForLatest.swift
//  TEST
//
//  Created by Steven Kirke on 21.03.2023.
//

import SwiftUI

struct CartForLatest: View {
    
    var workNumber: WorkToNumber = WorkToNumber()
    
    var item: Latest
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CustomImage(image: item.imageURL)
                   .scaledToFill()
                   .frame(width: 120, height: 150)
                   .overlay(
                       RoundedRectangle(cornerRadius: 9)
                           .fill(LinearGradient(colors: [Color.white.opacity(0),Color.black.opacity(0.6)], startPoint: .top, endPoint: .bottom))
                   )
                   .mask(RoundedRectangle(cornerRadius: 9))
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.category)
                        .customFont(size: 10, weight: .semibold, color: .black)
                        .padding(.vertical, 4)
                        .padding(.horizontal,10)
                        .background(Color.g_C4C4C4_85)
                        .cornerRadius(6)
                    Text(item.name)
                        .customFont(size: 12, weight: .bold, color: .white)
                        .lineLimit(2)
                    Text("$ \(workNumber.forTrailingZero(number: item.price))")
                        .customFont(size: 12, weight: .bold, color: .white)
                }
                Spacer()
                CircleButton(image: Image(systemName: "plus"),
                             size: 20,
                             action: {})
                .padding(.bottom, 5)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 5)
        }
        .frame(width: 120, height: 150)
    }
}


#if DEBUG
struct CartForLatest_Previews: PreviewProvider {
    static var previews: some View {
        CartForLatest(item: latestMock)
    }
}
#endif

var latestMock: Latest =  Latest(category: "Phones",
                                 name: "iPhone 14 pro max",
                                 price: 2100,
                                 imageURL: "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg")
