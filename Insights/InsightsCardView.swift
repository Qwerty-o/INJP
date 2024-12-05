//
//  InsightsCardView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/29/24.
//

import SwiftUI

struct InsightsCardView: View {
   
       
          let title: String
          let color: Color
          let imageName: String

          var body: some View {
            ZStack {
              Rectangle()
                .fill(color)
                .frame(width: 350, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))

              HStack {
                Text(title)
                  .font(.custom("ArialRoundedMTBold", size: 30))
                  .fontWeight(.heavy)
                  .foregroundStyle(Color.white)
                  .padding(.leading, 50)

                Image(systemName: imageName)
                  .resizable()
                  .foregroundColor(.white)
                  .frame(width: 35, height: 50)
                  .frame(maxWidth: 105)
              }
            }
          }
        }
    


#Preview {
    InsightsCardView(title: "m", color: .black, imageName: "circle")
        }
