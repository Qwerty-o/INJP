//
//  lastPeriodDateView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 5/5/24.
//

import SwiftUI

struct LastPeriodDateView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var user: UserModel
    
    var body: some View {
        ZStack {
            //  Color("backgroundColor").ignoresSafeArea() // only do this to change background
            VStack(spacing: 24) {
                
                Image("LastPeriodView")
                    .resizable()
                    .scaledToFit()
                    .frame(width:400)
                // .padding(.vertical, 2)
                
                
            
                Text("Please enter the date your last period started (e.g., YYYY-MM-DD):")
                    .font(.custom("ArialRoundedMTBold", size: 30))
                    .multilineTextAlignment(.center)
                
                InputView(
                    text: $user.lastPeriodStartDate,
                    title: "",
                    placeholder: "Enter here",
                    isSecureField: false)
                .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                .padding(.leading, 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("standard"), lineWidth: 5)
                    )
                    .padding(20)

                
            }
        
        Spacer()
        
        HStack(alignment: .bottom) {
            Spacer()
            
            NavigationLink {
              AverageCycleLengthView()
            } label: {
                //  Spacer()
                HStack(spacing: 5) {
                    Text("Next")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.standard)
                .padding(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.standard, lineWidth: 5)
                )
                
                
            }
        }
        
        .padding()
    }
    
    
    
}
#Preview {
    LastPeriodDateView()
}
