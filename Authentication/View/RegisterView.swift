//
//  RegisterView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 1/29/24.
//

import SwiftUI

struct RegisterView: View {
//    @State public var email = ""
//    @State public var fullname = ""
//    @State public var password = ""
    @State public var confirmPassword = ""
//    @State public var lastPeriodlength = ""
//    @State public var avgPeriodlength = ""
//    @State public var cycleLength = ""

    @State private var isValidEmail = true
    @State private var isValidPassword = true
    @State private var isValidConfirmPassword = true
    @State private var isValidfullname = true
    
    @State private var showingAlert = true
    
  
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var user: UserModel

    var canProceed: Bool {
        Validator.validateEmail(user.email)
        && Validator.validatePassword(user.password)
        && Validator.validateFullName(user.fullname)
        && Validator.validateConfirmPassword(user.password,confirmPassword)
    }
    
    var body: some View {
        VStack{
            //image
            Image("logo-color")
                .resizable()
                .scaledToFit()
                .frame(width:400)
                .padding(.vertical, -61)
            
            
            VStack(spacing: 24) {
                InputView(
                    text: $user.email,
                    title: "Email Address",
                    placeholder: "name@example.com")
                .autocapitalization(.none) //bc emails dont have capital letters DUH
                .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)

                .onChange(of: user.email) {
                    isValidEmail = Validator.validateEmail(user.email)
                }
                
                
                InputView(
                    text: $user.fullname,
                    title: "Full Name",
                    placeholder: "Enter your name",
                    isSecureField: false)
                .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .onChange(of: user.fullname) {
                    isValidfullname = Validator.validateFullName(user.fullname)
                }
                
                InputView(
                    text: $user.password,
                    title: "Password",
                    placeholder: "Enter your password",
                    isSecureField: true)
                .onChange(of: user.password) {
                    isValidPassword = Validator.validatePassword(user.password)
                }
                
                ZStack(alignment: .trailing) {
                    InputView(
                        text: $confirmPassword,
                        title: "Confirm Password",
                        placeholder: "Confirm your password",
                        isSecureField: true)
                    
                    .onChange(of: confirmPassword) {
                        isValidConfirmPassword = Validator.validateConfirmPassword(user.password, confirmPassword)
                    }
                    
                    if !user.password.isEmpty && !confirmPassword.isEmpty {
                        if user.password ==  confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight (.bold)
                                .foregroundColor(Color(.systemRed))
                            
                        }
                    }
                }
            }
            
            .padding(.horizontal)
            .padding(.top, 12)
            
            NavigationLink {
                    LastPeriodDateView()
                } label: {
                    HStack {
                        Text("Sign Up")
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
            
        
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                }
                .font(.system(size: 14))
            }
            
        }
    }
}
    
    #Preview {
        RegisterView()
    }

