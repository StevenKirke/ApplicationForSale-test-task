//
//  CardDescriptionView.swift
//  TEST
//
//  Created by Steven Kirke on 26.03.2023.
//

import SwiftUI

struct CardDescription: View {
    
    var workNumber: WorkToNumber = WorkToNumber()
    
    var modelD: Description?
    
    @Binding var indexForImage: Int
    @Binding var currentColor: Int
    
    var name: String {
        guard let name = modelD?.name else {
            return ""
        }
        return name
    }
    
    var description: String {
        guard let description = modelD?.description else {
            return ""
        }
        return description
    }
    
    var colours: [String] {
        guard let colours = modelD?.colors else {
            return []
        }
        return colours
    }
    
    var images: [String] {
        guard let images = modelD?.imageUrls else {
            return []
        }
        return images
    }
    
    var price: String {
        guard let price = modelD?.price else {
            return "$"
        }
        return "$ \(workNumber.forTrailingZero(number: price))"
    }
    
    var raiting: String {
        guard let raiting = modelD?.rating else {
            return ""
        }
        return String(raiting)
    }
    
    var numberOfReviews: String {
        guard let numberOfReviews = modelD?.numberOfReviews else {
            return ""
        }
        return  "(\(String(numberOfReviews)) reviews)"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 20) {
                HStack(spacing: 13) {
                    ForEach(images.indices, id: \.self) { index in
                        MiniatureIcon(indexForImage: $indexForImage,
                                      image: images[index],
                                      index: index +  1)
                    }
                }
                .padding(.top, 30)
                HStack(spacing: 0) {
                    Text(name)
                        .customFont(size: 14, weight: .bold, color: .b_161826)
                        .lineLimit(2)
                    Spacer()
                    Text(price)
                        .customFont(size: 14, weight: .bold, color: .b_161826)
                }
                HStack(spacing: 0) {
                    Text(description)
                        .customFont(size: 12, weight: .light, color: .g_808080)
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                    
                    Spacer(minLength: 100)
                }
                HStack(spacing: 5) {
                    Image(systemName: "star")
                        .iconSize(size: 14, color: .gl_F6C042)
                        .fontWeight(.bold)
                    Text(raiting)
                        .customFont(size: 12, weight: .bold, color: .b_161826)
                    Text(numberOfReviews)
                        .customFont(size: 12, weight: .regular, color: .g_737373)
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Color:")
                            .customFont(size: 12, weight: .semibold, color: .g_737373)
                        HStack(spacing: 14) {
                            ForEach(colours.indices, id: \.self) { index in
                                ColorButton(currentColor: $currentColor,
                                            index: index,
                                            color: colours[index])
                                .onAppear() {
                                    print(colours[index])
                                }
                            }
                        }
                        
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 22)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


#if DEBUG
struct CardDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PageTwoView()
    }
}
#endif
