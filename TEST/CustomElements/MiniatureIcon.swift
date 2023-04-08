//
//  MiniatureIcon.swift
//  TEST
//
//  Created by Steven Kirke on 24.03.2023.
//

import SwiftUI

struct MiniatureIcon: View {
    
    @Binding var indexForImage: Int
    var image: String
    let index: Int
    
    var isActive: Bool {
        indexForImage == index ? true : false
    }
    var body: some View {
        Button(action: {
            DispatchQueue.main.async {
                withAnimation {
                    self.indexForImage = index
                }
            }
        }) {
            VStack {
                CustomImage(image: image)
                    .scaledToFill()
                    .frame(width: 67, height: 38)
                    .mask(RoundedRectangle(cornerRadius: 9))
                    .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.g_EBEBEB, lineWidth: !isActive ? 1 : 0))
                    .offset(y: isActive ? -8 : 0)
                    .scaleEffect(isActive ? 1.2 : 1)
                    .shadow(color: .black.opacity(isActive ? 0.25 : 0),
                            radius: isActive ? 3 : 0, x: 0, y: 4)
                    .animation(.linear(duration: 1), value: true)
            }
        }
    }
}


#if DEBUG
struct MiniatureIcon_Previews: PreviewProvider {
    static var previews: some View {
        MiniatureIcon(indexForImage: .constant(0),
                      image: "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg", index: 0)
    }
}
#endif


