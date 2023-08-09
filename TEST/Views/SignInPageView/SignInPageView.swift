//
//  SignInPageView.swift
//  TEST
//
//  Created by Steven Kirke on 17.03.2023.
//

import SwiftUI




struct SignInPageView: View {
    
    
    @ObservedObject var userModel: UserProfile = UserProfile()
    @ObservedObject var signInVM: SignInViewModel = SignInViewModel()
    
    @State var width: CGFloat = 0
    @State var emailValid: String = ""
    @State var isValid: Bool = false
    @State var isActive: Bool = false
    @State var labelKeyBoard: Bool = false
    
    @FocusState private var focused: Field?

    
    var body: some View {
        NavigationView {
            ZStack {
                Color.w_FAF9FF
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Spacer()
                        Text("Sign in")
                            .customFont(size: 26, weight: .semibold, color: .black)
                            .padding(.bottom, 90)
                    }
                    .frame(height: 248)
                    VStack(spacing: 36) {
                        CustomTextFields(placeHolder: "First name", title: $userModel.currentUser.firstName)
                            .focused($focused, equals: .firstNameField)
                        CustomTextFields(placeHolder: "Last name", title: $userModel.currentUser.lastName)
                            .focused($focused, equals: .lastNameField)
                        ZStack {
                            CustomTextFieldEmail(placeHolder: "Email",
                                                 title: $userModel.currentUser.email,
                                                 emailValid: $emailValid,
                                                 isValid: $isValid)
                            .focused($focused, equals: .emailField)
                            if !emailValid.isEmpty {
                                Text(emailValid)
                                    .customFont(size: 12, weight: .semibold, color: .r_F93A3A)
                                    .offset(y: 28)
                            }
                        }
                        NavigationLink(destination: ContentView(), isActive: $isActive) {
                            CustomButton(title: "Sign in", color: .g_EAEAEA, action: {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        self.signInVM.answerUser(user: userModel.currentUser) { isCorrectField, error in
                                            if isCorrectField && isValid {
                                                self.signInVM.answerEmail(email: userModel.currentUser.email, model: userModel.currentUser) { isUser, error in
                                                    if !isUser {
                                                        self.signInVM.saveUserInUserDefault(currentUser: userModel.currentUser)
                                                        self.isActive.toggle()
                                                    } else {
                                                        self.emailValid = error
                                                    }
                                                }
                                            } else {
                                                self.emailValid = error
                                            }
                                        }
                                    }
                                }
                            })
                            .padding(.top, 8)
                        }
                    }
                    HStack(spacing: 9) {
                        Text("Already have an account?")
                            .customFont(size: 12, weight: .medium, color: .g_808080)
                        NavigationLink(destination: LoginView()) {
                            Text("Log in")
                                .customFont(size: 12, weight: .medium, color: .b_254FE6)
                        }
                        Spacer()
                    }
                    .frame(height: 10)
                    .padding(.top, 20)
                    VStack(alignment: .leading, spacing: 48) {
                        Spacer()
                        CustomButtonWithImage(title: "Sign in with Google", image: .google, action: {})
                        CustomButtonWithImage(title: "Sign in with Apple", image: .apple, action: {})
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    Spacer()
                }
                .padding(.horizontal, 44)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}



#if DEBUG
struct SignInPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
    }
}
#endif

