//
//  TypeSaleForPageOneView.swift
//  TEST
//
//  Created by Steven Kirke on 20.03.2023.
//

import SwiftUI

struct TypeSaleForPageOneView: View {
    
    @Binding var item: TypeSales
    
    var body: some View {
        
        GeometryReader { proxy in
            let width: CGFloat = (proxy.size.width) / CGFloat(TypeSales.allCases.count)
            HStack(alignment: .center, spacing: 0) {
                ForEach(TypeSales.allCases, id: \.self) { item in
                    Button(action: {
                        DispatchQueue.main.async {
                            withAnimation {
                                self.item = item
                            }
                        }
                    }) {
                        VStack(spacing: 15) {
                            item.image
                                .iconSize(size: 20, color: .b_161826)
                                .background(
                                    Circle()
                                        .fill(Color.g_EEEFF4)
                                        .frame(width: 40, height: 40)
                                )
                            Text(item.title)
                                .customFont(size: 10, weight: .light, color: .w_A6A7AB)
                        }
                        .frame(width: width)
                    }
                }
            }
        }
        .frame(height: 64)
    }
}


#if DEBUG
struct TypeSaleForPageOneView_Previews: PreviewProvider {
    static var previews: some View {
        TypeSaleForPageOneView(item: .constant(TypeSales.phone))
    }
}
#endif
