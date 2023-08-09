//
//  CardForSale.swift
//  TEST
//
//  Created by Steven Kirke on 21.03.2023.
//

import SwiftUI

struct CardForSale: View {
    
    var workNumber: WorkToNumber = WorkToNumber()
    
    var item: FlashSale
    
    var body: some View {
        NavigationLink(destination: PageTwoView()) {
            ZStack {
                ZStack {
                    Color.clear.background(Color.white)
                        .cornerRadius(11)
                        .shadow(radius: 4)
                    CustomImage(image: item.imageURL)
                        .scaledToFit()
                        .frame(width: 184)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .mask(RoundedRectangle(cornerRadius: 9))
                }
                ZStack(alignment: .bottom) {
                    VStack(spacing: 0) {
                        HStack(alignment: .top, spacing: 0) {
                            Image("ImageForMock/cartUserForMock")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 30)
                                .clipShape(Circle())
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Circle().stroke(Color.g_B9B9B9, lineWidth: 1)
                                )
                            Spacer()
                            Text("\(item.discount)% off")
                                .customFont(size: 12, weight: .semibold, color: .white)
                                .padding(.vertical, 5)
                                .padding(.horizontal,10)
                                .background(Color.r_F93A3A)
                                .cornerRadius(10)
                        }
                        Spacer()
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.category)
                                    .customFont(size: 10, weight: .semibold, color: .black)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal,10)
                                    .background(Color.g_C4C4C4_85)
                                    .cornerRadius(10)
                                HStack(spacing: 0) {
                                    Text(item.name)
                                        .customFont(size: 12, weight: .bold, color: .black)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                        .frame(width: 50)
                                }
                                .frame(height: 40, alignment: .top)
                                Text("$ \(workNumber.forTrailingZero(number: item.price))")
                                    .customFont(size: 12, weight: .bold, color: .black)
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                    HStack(spacing: 20) {
                        Spacer()
                        CircleButton(image: Image(systemName: "heart"), size: 28, action: {
                            print("heart")
                        })
                        CircleButton(image: Image(systemName: "plus"), size: 35, action: {
                            print("plus")
                        })
                    }
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                }
            }
            .frame(width: 184, height: 231)
        }
    }
}


#if DEBUG
struct CardForSale_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                CardForSale(item: saleMockFirst)
                CardForSale(item: saleMockSecond)
                CardForSale(item: saleMockThird)
            }
        }
    }
}
#endif

var saleMockFirst: FlashSale =  FlashSale(category: "Kids",
                                     name: "New balance",
                                     price: 18.00,
                                     discount: 30,
                                     imageURL: "https://www.kids-world.com/images/ZA050.jpg")
var saleMockSecond: FlashSale =  FlashSale(category: "Kids",
                                     name: "New Balance Sneakers",
                                     price: 22.5,
                                     discount: 30,
                                     imageURL: "https://cdn.shopify.com/s/files/1/2358/2817/products/New-Balance-550-Burgundy-Cyan-1.png?v=1689610356&width=1940")
var saleMockThird: FlashSale =  FlashSale(category: "Kids",
                                     name: "Reebok BB 4000 II Shoes - White/Core Black/Pure Grey",
                                     price: 98.95,
                                     discount: 30,
                                     imageURL: "https://shop.ccs.com/cdn/shop/products/195744069953-2.jpg?v=1682037290")
