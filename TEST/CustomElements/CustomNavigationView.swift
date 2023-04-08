//
//  CustomNavigationView.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import SwiftUI


struct CustomNavigationView: View {
        
    var userImage: Image
    var action: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Button(action: {}) {
                RectangleButton()
            }
            Spacer()
            Text("Trade by data")
                .customFont(size: 20, weight: .bold, color: .black)
            Spacer()
            ZStack(alignment: .bottom) {
                userImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 34)
                    .clipShape(Circle())
                        .frame(width: 34, height: 34)
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 1)
                    )
                HStack(spacing: 4) {
                    Button(action: action) {
                        Text("Location")
                            .customFont(size: 10, weight: .light, color: .g_5B5B5B)
                        Image(systemName: "chevron.down")
                            .iconSize(size: 6, color: .black)
                    }
                }
                .offset(y: 18)
            }
            .padding(.trailing, 30)
        }
        .frame(height: 50)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .onAppear() {
//            let str = "Trade by bata"
//            let clean = str.filter{ $0.isLetter || $0.isWhitespace }
//            if let lastIndex = clean.lastIndex(of: " "),
//               let index = clean.index(lastIndex, offsetBy: 1, limitedBy: clean.index(before: clean.endIndex)) {
//                let lastWord = clean[index...]
//                print(lastWord)
//            }
        }
    }
}

private struct RectangleButton: View {
    var body: some View {
        VStack(spacing: 3) {
            ForEach(0..<4) { _ in
                RoundedRectangle(cornerRadius: 2)
                    .fill(.black)
                    .frame(width: 22, height: 3)
            }
        }
    }
}



#if DEBUG
struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(userImage: Image("Icons/Mocks/Profile/PhotoProfile"),
                             action: {})
    }
}
#endif

