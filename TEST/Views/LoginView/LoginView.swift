//
//  LoginView.swift
//  TEST
//
//  Created by Steven Kirke on 18.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM: LoginViewModel = LoginViewModel()
    
    @Environment(\.presentationMode) var returnSingIn: Binding<PresentationMode>
    
    @State var isUser: Bool = false
    @State var errorLabel: String = ""
    @FocusState private var focused: Field?
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Color.w_FAF9FF
                    .edgesIgnoringSafeArea(.all)
                HStack(spacing: 0) {
                    Button(action: {
                        DispatchQueue.main.async {
                            withAnimation {
                                self.returnSingIn.wrappedValue.dismiss()
                            }
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .iconSize(size: 20, color: .black)
                    }
                    .padding(.leading, 20)
                    .padding(.top, 70)
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    Spacer()
                    Text("Welcome back")
                        .customFont(size: 26, weight: .semibold, color: .b_161826)
                        .padding(.bottom, 90)
                }
                .frame(height: 248)
                VStack(spacing: 36) {
                    CustomTextFields(placeHolder: "First name", title: self.$loginVM.firstName)
                        .focused($focused, equals: .firstNameField)
                    ZStack {
                        CustomPasswordFields(placeHolder: "Password", title: self.$loginVM.password)
                            .focused($focused, equals: .password)
                        if !errorLabel.isEmpty {
                            Text(errorLabel)
                                .customFont(size: 12, weight: .semibold, color: .r_F93A3A)
                                .offset(y: 28)
                        }
                    }
                    NavigationLink(destination: ContentView(), isActive: $isUser) {
                        CustomButton(title: "Login", color: .g_EAEAEA, action: {
                            DispatchQueue.main.async {
                                withAnimation {
                                    self.loginVM.answerUser() { isUser, error in
                                        if !isUser {
                                            self.errorLabel = error
                                        } else {
                                            self.isUser.toggle()
                                        }
                                    }
                                }
                            }
                        })
                    }
                    .padding(.top, 85)
                }
                Spacer()
            }
            .padding(.horizontal, 44)
        }
        .onAppear() {
            self.loginVM.getCurrentUser()
            self.returnSingIn.wrappedValue.dismiss()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .onDisappear() {
            self.loginVM.firstName = ""
            self.loginVM.password = ""
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: {
                    if loginVM.firstName.isEmpty {
                        focused = .firstNameField
                    } else if loginVM.password.isEmpty {
                        focused = .password
                    } else {
                        UIApplication.shared.endEditing()
                    }
                }) {
                     Text("Next")
                        .customFont(size: 14, weight: .bold, color: .black)
                }
                .buttonStyle(.borderless)
            }
        }

    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif


