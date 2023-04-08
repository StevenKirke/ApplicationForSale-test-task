//
//  InfinityCarousel.swift
//  TEST
//
//  Created by Steven Kirke on 22.03.2023.
//

import SwiftUI



struct InfinityCarousel: View {
    
  @Binding var imagesDecs: [ImageDescription]
    
    @State var offset: CGFloat = 0
    
    @Binding var currentIndex: Int
    @Binding var fakeIndex: Int
    
    var body: some View {
        TabView(selection: $fakeIndex) {
            ForEach(imagesDecs) { tab in
                VStack(spacing: 0) {
                    Spacer()
                    VStack(spacing: 0) {
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                            CustomImage(image: tab.image)
                                .frame(width: 300, height: 300)
                                .cornerRadius(9)
                            VStack {
                                Button(action: {}) {
                                    Image(systemName: "heart")
                                        .iconSize(size: 15, color: .v_545589)
                                }
                                Rectangle()
                                    .fill(Color.v_545589)
                                    .frame(width: 12, height: 1)
                                Button(action: {}) {
                                    Image("Icons/OuthersIcon/triangleIcon")
                                        .iconSize(size: 15, color: .v_545589)
                                }
                            }
                            .padding(.vertical, 15)
                            .padding(.horizontal, 13)
                            .background(Color.g_E5E9EF)
                            .cornerRadius(14)
                            .padding(.bottom, 24)
                            .offset(x: 20)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .padding(.horizontal, 30)
                .overlay(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: OffsetKey.self,
                                        value: proxy.frame(in: .global).minX)
                    }
                )
                .onPreferenceChange(OffsetKey.self) { offset in
                        self.offset = offset
                }
                .tag(getIndex(imageDesc: tab))
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 350)
        .padding(.top, 50)
        .onChange(of: fakeIndex) { newValue in
                if fakeIndex == 0 {
                    fakeIndex = imagesDecs.count - 2
                }
                if fakeIndex == imagesDecs.count - 1 {
                    fakeIndex = 1
                }
        }
        .onAppear() {
            guard var first = imagesDecs.first else {
                return
            }
            guard var last = imagesDecs.last else {
                return
            }
            
            first.id = UUID().uuidString
            last.id  = UUID().uuidString
            
            imagesDecs.append(first)
            imagesDecs.insert(last, at: 0)
            
            fakeIndex = 1
        }
    }
    
    private func getIndex(imageDesc: ImageDescription) -> Int {
        let index = imagesDecs.firstIndex { currentIndex in
            return currentIndex.id == imageDesc.id
        } ?? 0
        return index
    }
}


#if DEBUG
struct InfinityCarousel_Previews: PreviewProvider {
    static var previews: some View {
        PageTwoView()
    }
}
#endif


var descriptionMock: [ImageDescription] = [
        ImageDescription(image: "Spirit"),
        ImageDescription(image: "Perseverance"),
        ImageDescription(image: "Opportunity")
    ]
