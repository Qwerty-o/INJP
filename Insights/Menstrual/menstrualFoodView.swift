//
//  menstrualFoodView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/29/24.
//
//MARK: photos finished and whole thing is good to go

import SwiftUI

struct menstrualFoodView: View {
    @Environment(\.dismiss) private var dismiss
    let menstrualFoodImageNames = ["lutealfood-1", "lutealfood-2", "lutealfood-3", "lutealfood-4"]
    
    var body: some View {
        NavigationStack {
            HStack(alignment:.center) {
                // Button
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.cprimary)
                    //                        .background {
                    //                            Circle()
                    //                                .fill(.white)
                    //                                .frame(width: 150, height:150)
                    //                        }
                        .padding(.trailing, 75)
                        .padding(.bottom, 20)
                }
                
                // Text - Main Heading
                Text("Menstrual Phase Food Guide")
                    .font(.custom("ArialRoundedMTBold", size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.csecondary)
                    .font(.title) // Larger and bolder for main heading
                    .padding(.init(top: 10, leading: 20, bottom: 20, trailing: 10))
                //TODO: change the font
                
            }
            
            // Scrollable Text Content
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Image Grid Section
                    VStack(spacing: 10) {
                        HStack(spacing: 10) { // First row of images
                            ForEach(menstrualFoodImageNames.prefix(2), id: \.self) { imageName in
                                ZStack(alignment: .center) { // Center content within ZStack
                                    VStack { // Use VStack for vertical centering
                                        Spacer()
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .clipped()
                                            .overlay( // Add rounded corners or border (optional)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                            )
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        HStack(spacing: 10) { // Second row of images
                            ForEach(menstrualFoodImageNames.suffix(2), id: \.self) { imageName in
                                ZStack(alignment: .center) { // Center content within ZStack
                                    VStack { // Use VStack for vertical centering
                                        Spacer()
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .clipped()
                                            .overlay( // Add rounded corners or border (optional)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                            )
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    
                    Text("During menstruation, the body experiences various physical changes. These may include: \n\n * Bleeding: The shedding of the uterine lining, lasting 2-7 days. Flow can vary from light to heavy. \n * Cramps: Uterine contractions to expel menstrual blood. Pain can be mild or severe, localized in the lower abdomen. \n * Bloating: Fluid retention caused by hormonal changes, leading to abdominal swelling and discomfort. \n * Breast tenderness: Hormonal fluctuations can make breasts feel swollen, tender, or painful. \n * Headaches: Changes in hormone levels can trigger headaches, ranging from mild to severe. \n * Fatigue: Fluctuations in estrogen and progesterone can cause low energy levels and tiredness.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Menstruation can also affect emotional well-being. Some common mental symptoms include: \n\n * Mood swings: Hormonal changes can lead to irritability, anxiety, or depression. \n * Food cravings: Increased desire for sugary or salty foods due to hormonal shifts and blood sugar fluctuations. \n * Difficulty concentrating: Hormonal changes may impact focus and cognitive function. \n * Sleep disturbances: Difficulty falling asleep, staying asleep, or experiencing restless sleep.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Dietary choices can significantly impact your experience during menstruation. Here's how to support your body through food: \n\n * Fight inflammation: Include foods rich in omega-3 fatty acids (fish, nuts, seeds) and fruits/vegetables rich in antioxidants (berries, leafy greens) to reduce inflammation and discomfort. \n * Regulate blood sugar: Focus on complex carbohydrates (whole grains, legumes) for sustained energy, minimizing cravings and mood swings. \n * Limit certain foods: Processed foods, fried foods, and high-sodium foods can worsen bloating. Minimize caffeine, alcohol, and refined sugars to regulate mood and sleep.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Every woman experiences menstruation differently. Listen to your body and adjust your diet and lifestyle as needed. Consult a healthcare professional or registered dietitian for personalized guidance.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                }
            }
        }
        
    }
    
    
}



#Preview {
    menstrualFoodView()
}
