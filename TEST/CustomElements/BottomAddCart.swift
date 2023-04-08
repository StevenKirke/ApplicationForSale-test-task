//
//  BottomAddCart.swift
//  TEST
//
//  Created by Steven Kirke on 24.03.2023.
//

import SwiftUI

struct BottomAddCart: View {
    
    @Binding var balance: String
    var removeProduct: () -> Void
    var addProduct: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack(alignment: .top) {
                Color.clear.background(Color.b_181726)
                    .cornerRadius(33)
                HStack(spacing: 60) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Quantity:")
                            .customFont(size: 12, weight: .semibold, color: .g_808080)
                        HStack(spacing: 20) {
                            Button(action: removeProduct) {
                                Image(systemName: "minus")
                                    .iconSize(size: 7, color: .white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 18)
                                    .background(Color.b_4E55D7)
                                    .cornerRadius(7)
                            }
                            
                            Button(action: addProduct) {
                                Image(systemName: "plus")
                                    .iconSize(size: 7, color: .white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 18)
                                    .background(Color.b_4E55D7)
                                    .cornerRadius(7)
                            }
                        }
                    }
                    Button(action: {}) {
                        HStack(spacing: 33) {
                            Text("$ \(balance)")
                                .customFont(size: 12, weight: .semibold, color: .v_99A0FF)
                            Text("Add to cart")
                                .customFont(size: 12, weight: .semibold, color: .white)
                                .textCase(.uppercase)
                        }
                        .padding(.vertical, 19)
                        .padding(.horizontal, 30)
                        .background(Color.b_4E55D7)
                        .cornerRadius(15)
                    }
                }
                .padding(.top, 20)
            }
            .frame(width: UIScreen.main.bounds.width, height: 160)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


#if DEBUG
struct BottomAddCart_Previews: PreviewProvider {
    static var previews: some View {
        BottomAddCart(balance: .constant("$ 9999.88"),
                      removeProduct: {},
                      addProduct: {}
        )
    }
}
#endif
