//
//    MenstrualInsightsView().swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 2/8/24.
//

import SwiftUI

struct   MenstrualInsightsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            if let user = viewModel.currentUser {
                VStack(alignment: .leading) {
                    
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .background {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 42, height: 42)
                            }
                            .padding(.trailing, 60)
                            .padding(.bottom, 35)
                        
                    }
                    
                    Section {
                        let firstName = user.fullname.split(separator: " ").first ?? "Unknown"
                        Text("Hello \(firstName.lowercased())!")
                            .font(.largeTitle.bold())
                            .padding(.bottom)
                        Text("Let's explore some insights for the menstrual phase")
                            .font(.title2)
                            .padding(.bottom)
                    }
                }
                
                
                
                
                
                
                
                
                // Optimized card layout using LazyVGrid
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 22) {
                    NavigationLink {
                        menstrualFoodView()
                            .navigationBarBackButtonHidden(true)
                        
                        
                    } label: {
                        insightCard(image: "fork.knife.circle", title: "Food")
                    }
                    
                    NavigationLink {
                        menstrualengthergyView()
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        insightCard(image: "bolt.fill", title: "Energy")
                    }
                    
                    NavigationLink {
                        menstrualHormonesView()
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        insightCard(image: "heart", title: "Hormones")
                    }
                    
                    NavigationLink {
                        menstrualBodyView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        insightCard(image: "figure.mind.and.body", title: "Body")
                    }
                }
                .padding()
            } else {
                Text("No user logged in")
            }
        }
    }
    
    private func insightCard(
        image: String,
        title: String,
        color: Color = .cprimary
    ) -> some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(width: 170, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(20)
            VStack {
                Image(systemName: image)
                    .foregroundStyle(.white)
                    .font(.system(size: 40))
                Text(title)
                    .foregroundStyle(.white)
                    .font(.custom("Monaco", fixedSize: 26))
                    .padding(.bottom, 15)
            }
        }
    }
}

#Preview {
    MenstrualInsightsView()
}
