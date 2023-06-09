//
//  SkeletonLoader.swift
//  TEST
//
//  Created by Steven Kirke on 05.04.2023.
//

import SwiftUI

struct SkeletonLoader: View {
    
    private let background: Color = Color.black.opacity(0.1)
    private let color: [Color] = [
        Color.gray.opacity(0.0),
        Color.gray.opacity(0.1),
        Color.gray.opacity(0.0)
    ]
    
    @State var tempOffset: CGFloat = 0
 
    var widthContainer: CGFloat
    var heighContainer: CGFloat

    init(_ widthContainer: CGFloat, _ heighContainer: CGFloat) {
        self.widthContainer = widthContainer
        self.heighContainer = heighContainer
    }
    
    var widthGradient: CGFloat = 100
    var heigtGradient: CGFloat {
        heighContainer * (1 + (40 / 100))
    }
    var shape: Form = Form.roundRectangle(6)
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { proxy in
                    background
                        .frame(maxHeight: heighContainer)
                    Rectangle()
                        .fill(
                            LinearGradient(colors: color, startPoint: .leading, endPoint: .trailing)
                        )
                        .background(LinearGradient(colors: color, startPoint: .leading, endPoint: .trailing))
                        .rotationEffect(Angle(degrees: 7))
                        .frame(width: widthGradient, height: heigtGradient)
                        .offset(y: (heighContainer - heigtGradient) / 2)
                        .offset(x: CGFloat(tempOffset))
                }
            }
            .onAppear() {
                DispatchQueue.main.async {
                    self.tempOffset = -(widthGradient)
                    withAnimation(Animation.linear(duration: 3)
                        .repeatForever(autoreverses: false)) {
                            self.tempOffset = widthContainer + (widthGradient / 2)
                        }
                }
            }
        }
        .frame(width: widthContainer, height: heighContainer)
        .mask(shape.translation)
    }
}

extension SkeletonLoader {
    enum Form  {
        case rectangle
        case roundRectangle(_ radius: CGFloat)
        case circle
        
        var translation: AnyView {
            switch self {
                case .rectangle:
                    return  AnyView(Rectangle())
                case .roundRectangle(let radius):
                    return  AnyView(RoundedRectangle(cornerRadius: radius))
                case .circle:
                    return  AnyView(Circle())
            }
        }
    }
}



struct SkeletonLoader_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonLoader(200, 300)
    }
}
