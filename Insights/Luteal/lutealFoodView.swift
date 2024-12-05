//
//  lutealFoodView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/31/24.
//

import SwiftUI

struct lutealFoodView: View {
    @Environment(\.dismiss) private var dismiss
    
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
                Text("Luteal Phase Food Guide")
                    .fontWeight(.bold)
                    .foregroundColor(.csecondary)
                    .font(.title) // Larger and bolder for main heading
                    .padding(.init(top: 10, leading: 20, bottom: 20, trailing: 10))
                    .font(.custom("Luminari-Regular", size: 30))
               //TODO: change the font
                
            }
            
            // Scrollable Text Content
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Image Grid Section
                    VStack(spacing: 10) {
                        HStack(spacing: 10) { // First row of images
                            ForEach(lutealFoodImageNames.prefix(2), id: \.self) { imageName in
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
                            ForEach(lutealFoodImageNames.suffix(2), id: \.self) { imageName in
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
                    
                    
                    Text("The luteal phase is the latter part of the menstrual cycle, which begins after ovulation and ends with the start of the next period. During this phase, the body prepares for a potential pregnancy, and hormonal changes can lead to various physical and emotional symptoms, such as bloating, breast tenderness, mood swings, and food cravings. Proper nutrition during the luteal phase is essential for managing these symptoms and supporting overall well-being.")
                        .lineSpacing(10)
                        .padding(10)
                    
                    Text("One of the primary goals during the luteal phase is to combat inflammation, as this phase is often associated with increased levels of inflammatory markers. Incorporating anti-inflammatory foods into your diet can help alleviate discomfort and reduce the risk of associated conditions.")
                        .lineSpacing(10)
                        .padding()
                    
                    Text("Opt for foods rich in omega-3 fatty acids, such as: Fatty fish (salmon, mackerel, anchovies), Walnuts, Flaxseeds, and Chia seeds")
                    // .multilineTextAlignment()
                        .lineSpacing(10)
                        .padding()
                        .fontWeight(.heavy)
                    
                    
                    
                    Text("Additionally, load up on antioxidant-rich fruits and vegetables, including: Berries, Leafy Greens, Bell Peppers, and tomatoes as they reduce inflammation.")
                        .lineSpacing(10)
                        .padding()
                        .fontWeight(.heavy)
                    
                    
                    Text("It's also important to focus on foods that can help regulate blood sugar levels and prevent energy dips. During the luteal phase, the body may experience shifts in insulin sensitivity, which can lead to cravings for sugary or high-carb foods.")
                        .lineSpacing(10)
                        .padding()
                    
                    Text("To counteract this, prioritize complex carbohydrates, such as: Whole grains (brown rice, quinoa, oats), Legumes, Starchy vegetables (sweet potatoes, butternut squash)")
                        .lineSpacing(10)
                        .padding()
                        .fontWeight(.heavy)
                    
                    Text("These foods provide steady energy and help maintain balanced blood sugar levels, reducing the risk of mood swings and fatigue.")
                        .lineSpacing(10)
                        .padding()
                    
                    Text("Foods to Limit:")
                        .font(.title2)
                    
                    
                    Text("Steer clear of processed, fried, and high-sodium foods, as they can contribute to water retention and bloating. Additionally, minimize your intake of caffeine, alcohol, and refined sugars, as they can exacerbate mood swings, disrupt sleep patterns, and increase inflammation")
                        .lineSpacing(10)
                        .padding()
                    
                    Text("By adopting a luteal phase-friendly diet, you can support your body's needs during this time and potentially alleviate the associated symptoms. Remember, every individual's experience is unique, so it's essential to listen to your body and make adjustments as needed. Consulting with a healthcare professional or a registered dietitian can also provide personalized guidance tailored to your specific circumstances.")
                        .lineSpacing(10)
                        .padding()
                    
                    Spacer() // Add Spacer at the bottom for better scrolling experience
                }
            }
            //  .defaultScrollAnchor(.center)
            
            
            // Text - Foods to Limit
            //            Text("Foods to Limit:")
            //                .font(.title2)
            
            // ... other text sections outside the scroll view (optional)
            
            // }
        }
    }
}
let lutealFoodImageNames = ["lutealfood-1", "lutealfood-2", "lutealfood-3", "lutealfood-4"]

#Preview {
    lutealFoodView()
}
