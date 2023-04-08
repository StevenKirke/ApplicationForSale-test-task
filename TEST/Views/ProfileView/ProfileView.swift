//
//  ProfileView.swift
//  TEST
//
//  Created by Steven Kirke on 18.03.2023.
//

import SwiftUI


struct ProfileView: View {
    
    @Environment(\.presentationMode) var returnSingInView: Binding<PresentationMode>
    @ObservedObject var profileVM: ProfileViewModel = ProfileViewModel()
        
    var userName: String {
        return self.profileVM.takeFullName()
    }
    
    var balance: String {
        return self.profileVM.takeBalanse()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Text("Profile")
                    .customFont(size: 16, weight: .bold, color: .black)
                CustomPhotoPicker(profileVM: self.profileVM)
                    .padding(.vertical, 20)
                Text(userName)
                    .customFont(size: 16, weight: .bold, color: .black)
            }
            .padding(.vertical, 25)
            CustomButtomWithImageAndColor(title: "Upload item",
                                          image: .upload,
                                          action: {})
            .padding(.top, 10)
            VStack(spacing: 20) {
                ButtonForMenu(itenMenu: .tradeStore,
                              content: ChevronImage(),
                              action: {})
                ButtonForMenu(itenMenu: .payment,
                              content: ChevronImage(),
                              action: {})
                ButtonForMenu(itenMenu: .balance,
                              content: Text(balance),
                              action: {})
                ButtonForMenu(itenMenu: .tradeHistory,
                              content: ChevronImage(),
                              action: {})
                ButtonForMenu(itenMenu: .restore,
                              content: ChevronImage(),
                              action: {})
                ButtonForMenu(itenMenu: .help,
                              content: Text(""),
                              action: {})
                ButtonForMenu(itenMenu: .logOut,
                              content: Text(""),
                              action: {
                    DispatchQueue.main.async {
                        withAnimation {
                           self.returnSingInView.wrappedValue.dismiss()
                        }
                    }
                })
            }
            .foregroundColor(.black)
            .padding(.top, 20)
            .padding(.bottom, 30)
            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 44)
        .onAppear() {
            self.profileVM.getCurrentUser()
        }
    }
}

private struct ChevronImage: View {
    var body: some View {
        Image(systemName: "chevron.forward")
            .iconSize(size: 14, color: .b_040402)
            .fontWeight(.bold)
    }
}


#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif

