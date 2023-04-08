//
//  PageTwoView.swift
//  TEST
//
//  Created by Steven Kirke on 20.03.2023.
//

import SwiftUI


struct PageTwoView: View {
    
    @Environment(\.presentationMode) var returnPageOneView: Binding<PresentationMode>
    
    @ObservedObject var PageTwoVM: PageTwoViewModel = PageTwoViewModel()
    
    @State var currentImages: [ImageDescription] = []
    @State var indexForImage: Int = 0
    @State var currentColor: Int = 0
    @State var fakeIndex: Int = 0
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                if !currentImages.isEmpty {
                    InfinityCarousel(imagesDecs: $currentImages, currentIndex: $fakeIndex, fakeIndex: $indexForImage)
                    CardDescription(modelD: PageTwoVM.descriptionModels,
                                    indexForImage: $indexForImage,
                                    currentColor: $currentColor)
                }
                else {
                    EmptyView()
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .padding(.bottom, 50)
            HStack(spacing: 0) {
                Button(action: {
                    DispatchQueue.main.async {
                        withAnimation {
                           self.returnPageOneView.wrappedValue.dismiss()
                        }
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .iconSize(size: 20, color: .black)
                }
                .padding(.leading, 20)
                .padding(.top, 50)
                Spacer()
            }
            Spacer()
            BottomAddCart(balance: $PageTwoVM.balance, removeProduct: {
                PageTwoVM.removeProduct()
            },addProduct: {
                PageTwoVM.addProduct()
            })
        }
        .background(Color.w_FAF9FF)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.top)
        .onAppear() {
            PageTwoVM.getDescriptionData { images in
                self.currentImages = PageTwoVM.calculateImage(images: images)
                PageTwoVM.getCurrentUser()
                self.isActive.toggle()
            }
        }
        .onDisappear() {
            self.PageTwoVM.saveUserBalance()
        }
    }
}


#if DEBUG
struct PageTwoView_Previews: PreviewProvider {
    static var previews: some View {
        //PageTwoView()
        ContentView()
    }
}
#endif


