//
//  InsightsView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 2/3/24.
//

import SwiftUI

struct InsightsView: View {
    @State private var insightName = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var containerView = UIView()

    var body: some View {
        NavigationStack{
            
            if let user = viewModel.currentUser {
              Section {
                let firstName = user.fullname.split(separator: " ").first ?? "Unknown"
                let stringFirstName = String(firstName).lowercased()

                VStack {
                  Text("Hello, \(stringFirstName)!")
                    .font(.title)
                    .frame(alignment: .center)
                    .fontWeight(.semibold)

                  Text(
                    """
                    Let's explore some insights
                    """
                  )
                  .font(.headline)
                  .padding(.bottom)
                }
              }

              LazyVStack(spacing: 32) {
                NavigationLink {
                  MenstrualInsightsView()
                    .navigationBarBackButtonHidden(true) // 1

                } label: {
                  InsightsCardView(title: "Menstrual", color: .cprimary, imageName: "drop")
                }

                NavigationLink {
                  FollicularInsightsView()
                    .navigationBarBackButtonHidden(true) // 1

                } label: {
                    InsightsCardView(title: "Follicular", color: .brown, imageName: "heart.text.square")
                }

                NavigationLink {
                  LutealInsightsView()
                        .navigationBarBackButtonHidden(true) // 1

                } label: {
                    InsightsCardView(title: "Luteal", color: .csecondary, imageName: "moon.stars")
                }
              }
              .padding()
            } else {
              Text("No user logged in")
            }
                
          }
        

   

        //.navigationBarBackButtonHidden()
    }
       //.toolbar(.hidden, for: .tabBar) -> this is for hiding toolbar
}

#Preview {
    InsightsView()
}
