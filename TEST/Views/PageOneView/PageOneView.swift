//
//  PageOneView.swift
//  TEST
//
//  Created by Steven Kirke on 18.03.2023.
//

import SwiftUI


struct PageOneView: View {
    
    @ObservedObject var PageOneVM: PageOneViewModel = PageOneViewModel()
    
    @State var searchTitle: String = ""
    
    var userImage: Image {
        return self.PageOneVM.getUserImage()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.w_FAF9FF
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    CustomNavigationView(userImage: userImage, action: {})
                    .padding(.horizontal, 15)
                    CustomSearchField(placeHolder: "What are you looking for ?",
                                      search: $searchTitle)
                        .padding(.horizontal, 50)
                        .padding(.top, 30)
                    TypeSaleForPageOneView(item: $PageOneVM.itemNenu)
                        .padding(.top, 30)
                    ScrollView(.vertical, showsIndicators: false) {
                        BlocksCarousel(lates: PageOneVM.latestModels.latest,
                                       sales: PageOneVM.saleModels.flashSale,
                                       brands: PageOneVM.brandsModel)
                    }
                    .mask(
                        RoundedRectangle(cornerRadius: 7)
                    )
                    .padding(.horizontal, 15)
                    .padding(.top, 30)
                    .padding(.bottom, 60)
                    Spacer()
                }
                Spacer()
            }
            Spacer()
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}


#if DEBUG
struct PageOneView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
