//
// AverageCycleLengthView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 4/28/24.
//

import SwiftUI

struct AverageCycleLengthView: View {
    
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
                
                
            
                Text("Please enter the length of your average menstrual cycle (number of days between the start of one period and the next):")
                    .font(.custom("ArialRoundedMTBold", size: 30))
                    .padding(20)
                    .multilineTextAlignment(.center)
                
                TextField("write number here", value: $user.averageCycleLength, formatter: NumberFormatter())
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("standard"), lineWidth: 5)
                    )
                    .padding(30)
                
            }
        }
        Spacer()
        
        HStack(alignment: .bottom) {
            Spacer()
            Button{
                Task {
                    do {
                        try await viewModel.createUser(withEmail: user.email, password: user.password, fullname: user.fullname, lastPeriodStartDate: user.lastPeriodStartDate, averageCycleLength: user.averageCycleLength )
                        // Upon successful user creation, navigate to LastPeriodView()
                    } catch {
                        print("Error creating user: \(error)")
                        // Handle the error: show an alert, log the error, etc.
                    }
                    
                }
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
   AverageCycleLengthView()
}
