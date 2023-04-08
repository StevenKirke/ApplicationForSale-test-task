//
//  ContentView.swift
//  TEST
//
//  Created by Steven Kirke on 18.03.2023.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var contenVM: ContentViewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            Color.w_FAF9FF
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    CurentView(contentVM: contenVM)
                    TabBar(item: $contenVM.itemNenu, isBackMenu: $contenVM.backInMenu)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct CurentView: View {
    
    @ObservedObject var contentVM: ContentViewModel
    
    
    var body: some View {
        VStack(spacing: 0) {
            switch contentVM.itemNenu {
                case .pageOne: PageOneView()
                case .heart: HeartView()
                case .pay: PayView()
                case .chat: ChatView()
                case .profile: ProfileView()
            }
        }
    }
}

struct TabBar: View {
    
    @Binding var item: CustomTabBar
    @Binding var isBackMenu: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(CustomTabBar.allCases, id: \.self) { item in
                Button(action: {
                    if self.item != item {
                        DispatchQueue.main.async {
                            withAnimation {
                                self.item = item
                                self.isBackMenu.toggle()
                            }
                        }
                    }
                }) {
                    Image(item.image)
                        .iconSize(size: 20, color: .g_909090)
                        .background(
                            Circle()
                                .fill(
                                    Color.g_EEEFF4.opacity(self.item == item ? 1 : 0)
                                )
                                .frame(width: 40, height: 40)
                        )
                }
                if item != CustomTabBar.allCases.last {
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 30)
        .background(
            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 27)
                .fill(Color.white)
                .edgesIgnoringSafeArea(.bottom)
        )
        .padding(.bottom, 20)
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

