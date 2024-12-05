//
//  LoginView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 1/29/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    //environment  object can only be initialized once
    @State private var isValidEmail = true
    @State private var isValidPassword = true
   @EnvironmentObject var viewModel: AuthViewModel

    var canProceed: Bool {
        Validator.validateEmail(email) &&
        Validator.validatePassword(password)
    }


    
    var body: some View {
        NavigationStack{
            VStack{
                //image
                Image("logo-color")
                    .resizable()
                    .scaledToFit()
                    .frame(width:400)
                    .padding(.vertical, -202)
                    .padding(.bottom, 100) //makes it center
                VStack(spacing: 24) {
                    //login email input value for login page

                    InputView(
                        text: $email,
                        title: "Email Address",
                        placeholder: "name@example.com")
                    .autocapitalization(.none) //bc emails dont have capital letters DUH
                    .onChange(of: email) {
                        isValidEmail = Validator.validateEmail(email)
                    }
                  /*  if !isValidEmail {
                        HStack {
                            Text("Your email is not valid")
                                .foregroundColor(.red)
                                .padding (.leading)
                        }
                    }
                   */
                    //login password input value for login page
                    InputView(
                        text: $password,
                        title: "Password",
                        placeholder: "Enter your password",
                        isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                .onChange(of: password) {
                    isValidPassword = Validator.validatePassword(password)
                }
                /*
                if !isValidPassword {
                    HStack {
                        Text("Your password is not valid")
                            .foregroundColor(.red)
                            .padding (.leading)
                    }
                }
                 */
                //sign in button
                Button{
                  Task  {
                      try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack{
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width-32, height: 48)
                }
                .background(Color(.systemBrown))
                .disabled(!canProceed)
                .opacity(canProceed ? 1.0 : 0.5) //gonna give opacity depending on if the form is valid or not
                .cornerRadius(10)
                .padding(.top,24)
                
                
                //sign up button
                NavigationLink {
                    RegisterView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                    }
                    .font(.system(size: 14))
                }

            }
        }
    }
}
/*//MARK: authenitcationFormProtocol

extension LoginView: AuthenticationFormProcotol {
    var formIsValid: Bool{
        return !email.isEmpty 
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}
*/
#Preview {
    LoginView()
    
}
